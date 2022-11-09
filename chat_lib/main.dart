import 'package:flutter/material.dart';
import 'package:chef15/screens/main_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: LoginSignupScreen(),
    );
  }
}
