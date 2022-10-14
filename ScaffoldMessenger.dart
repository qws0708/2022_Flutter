import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  //const MyPage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold Messenger'),
      ),
      body: Homebody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.thumb_up),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            //ScaffoldMessenger는 모든 자손 Scaffold중 가장 가까운 Scaffold를 찾아서 반환 시켜줌
            SnackBar(
              content: Text('Like a new Snack bar!'),
              duration: Duration(seconds: 5),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThirdPage()));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class Homebody extends StatelessWidget {
  //const Homebody({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Go to the second page'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  //const SecondPage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: Center(
        child: Text(
          '좋아요가 추가 되었습니다.',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  //const SecondPage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return ScaffoldMessenger(  // Scaffold를 ScaffoldMessenger로 감싸면 ScaffoldMessenger의 자손으로 등록되지 않아 오류 발생 -> builder를 통한 하위 클래스 생성 필요
      child: Scaffold(
        appBar: AppBar(
          title: Text('ThirdPage'),
        ),
        body: Builder(  //Builder를 생성하여 ScaffoldMessenger의 하위 클래서 생성 => ScaffoldMessenger의 자손이 아니므로 다른 페이지에서 SnackBar 활성화 불가능
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '좋아요를 취소 하시겠습니까?',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.redAccent,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('좋아요가 취소되었습니다.'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                      child: Text('취소하기')),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
