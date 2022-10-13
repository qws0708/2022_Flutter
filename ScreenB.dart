import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget{

  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenB'),
      ),
      body: Center(
        child: Text('ScreenB',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}

