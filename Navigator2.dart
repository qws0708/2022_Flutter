import 'package:chef4/ScreenB.dart';
import 'package:chef4/ScreenC.dart';
import 'package:chef4/ScreenA.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', //initialRoute와 home은 동시 사용 불가, 키값 지정, Map구조(=사전구조)
      routes: {
        '/': (context) => ScreenA(),  //Key값인 /가 호출되면 Value값인 ScreenA가 실행되는 구조
        '/b': (context) => ScreenB(),
        '/c': (context) => ScreenC(),
      },
    );
  }
}

