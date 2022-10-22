import 'package:flutter/material.dart';
import 'mypage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 30,
            color: Colors.white
          )
        )

      ),
      home: MyPage(),
    );
  }
}
