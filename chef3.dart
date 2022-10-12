import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack bar',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyPage(),
    );
  }
}

// Scaffold.of(context) method : 현재 주어진 context에서 위로 올라가면서 가장 가까운
// Scaffold를 찾아서 반환하라는 의미
// ~~~~~~.of(context) : 현재 주언지 context에서 위로 올라가면서 가장 가까운 ~~~~를 찾아서 반환하라는 의미

class MyPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Snack Bar'),
          centerTitle: true,
        ),
        body: Builder(
          builder: (BuildContext ctx) {
            // MyPage와 구분하기 위해 context대신 ctx사용 -> context는 인스턴스라 이름을 마음대로 변경 가능
            // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Hello'),의 오류를 해결하기 위해
            // Scaffold 아래에 BUilder을 생성하여 Center값을 return함
            return Center(
              child: TextButton(
                child: Text(
                  'show me',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
                    content: Text('Hello'),
                  ));
                },
              ),
            );
          },
        ));
  }
}
