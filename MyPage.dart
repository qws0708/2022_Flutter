import 'package:flutter/material.dart';

import 'onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:
          OnBoardingPage(), //OnBoardinPage에 커서를 두고 alt + enter를 누르면 import 'onboarding.dart'; 생성됨.
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Main Page'), //업데이트 이후 static data(한번 정해지면 바뀌지않는 데이터)앞에 const를 선언해줘야 함. -> 안하면 밑줄 생김, RUN은 가능
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Main Screen',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  //.push대신 .pushReplacement 사용시 페이지 appbar에 뒤로 가기 버튼 없어짐
                  MaterialPageRoute(builder: (context) => const OnBoardingPage()),
                );
              },
              child: const Text('Go to onboarding screen'),
            ),
          ],
        ),
      ),
    );
  }
}
