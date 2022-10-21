import 'package:chef10/responsive/desktop_body.dart';
import 'package:chef10/responsive/mobile_body.dart';
import 'package:chef10/responsive/reponsive_layout.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: mobileBody(),
        desktopBody: desktopBody(),
      ),
    );
  }
}
