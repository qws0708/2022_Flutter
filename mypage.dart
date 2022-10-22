import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  //MediaQuery: 디바이스의 사이즈를 알아내거나 사용자가 원하는 사이즈로 앱을 빌드 시켜 줌
  //aspectRatio: 창의 가로세로 크기의 비율을 알려줌

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('MediaQuery'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Width: ' + MediaQuery.of(context).size.width.toString()),
            Text('Height: ' + MediaQuery.of(context).size.height.toString()),
            Text('AspectRatio: ' + MediaQuery.of(context).size.aspectRatio.toStringAsFixed(2)), //toStringAsFixed: 소수점 아래의 자릿수 지정
            Text('Orientation: ' + MediaQuery.of(context).orientation.toString()),
          ],
        ),
      ),
    );
  }
}
