import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BBANTO',
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: Text('BBANTO'),
        backgroundColor: Colors.amber[700],
        centerTitle: true, //appbar의 타이틀을 중앙으로 배치
        elevation: 0.0, //appbar의 띄어짐 정도 조절
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0), //여백조절 , LTRB = 왼쪽,위쪽,오른쪽,아래쪽
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Column위젯 내의 모든 위젯을 왼쪽 시작점을 기준으로 정렬
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('asset/플러터 기본 트리 구조.PNG'),  //이미지 파일 불러오기 -> yaml파일에서 assets에 경로 설정해줘야 함
                radius: 60.0,
              ),
            ),
            Divider( //가로선으로 나누기
              height: 60.0,
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30.0, //오른쪽 끝에서 부터 얼마나 떨어져서 시작하는지 설정
            ),
            Text('NAME',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,  //글자간(글자 사이의 띄어짐 정도)
            ),
            ),
            SizedBox(
              height: 10.0,
            ),

            Text('BBANTO',
            style:TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(
              height: 30.0,
            ),

            Text('BBANTO POWER LEVEL',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            Text('14',
              style:TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('using lightsaber',
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('face hero tattoo',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('fire flames',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('asset/dd.PNG'),
                radius: 40.0,
                backgroundColor: Colors.amber[800],
              ),
            ),
          ],
        ),
      ),

    );
  }
}