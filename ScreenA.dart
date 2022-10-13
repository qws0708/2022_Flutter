import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget{

  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //colum widget을 화면 정중앙에 위치
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text('Go to ScreenB'),
              onPressed: (){
                Navigator.pushNamed(context, '/b'); //키 값 입력
              },
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text('Go to ScreenC'),
              onPressed: (){
                Navigator.pushNamed(context, '/c'); //키 값 입력
              },
            ),

          ],
        ),
      ),
    );
  }
}

