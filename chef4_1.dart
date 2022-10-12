import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//toast 사용 전 yaml파일에 설정 후 import해줘야 코드가 실행이 됨.
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toast Message',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast Message'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            flutterToast();  //Toast Message를 실행 할 함수를 밑에 정의 후 불러옴
          },
          child: Text(
            'Toast',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}


// Toast Message는 of 없이도 함수를 호출하여 사용 가능

void flutterToast() {
  //Toast버튼 함수
  Fluttertoast.showToast(
    msg: 'Flutter',
    gravity: ToastGravity.BOTTOM,
    //위치 설정
    backgroundColor: Colors.redAccent,
    fontSize: 20.0,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT, //메세지가 화면에 나타나는 시간
  );
}
