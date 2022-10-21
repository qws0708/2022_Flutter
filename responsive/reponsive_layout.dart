import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key,required this.mobileBody, required this.desktopBody}) : super(key: key);

  final Widget mobileBody;
  final Widget desktopBody;
  
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth<800){
        return mobileBody;
      }
      else{
        return desktopBody;
      }
    }); //LayoutBuilder: 화면이 아닌 위젯의 크기를 알아냄
  }
}
