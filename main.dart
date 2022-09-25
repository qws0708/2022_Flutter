import 'package:flutter/material.dart';

void main () => runApp(MyApp());

class Person{
  String name;
  int age;

  Person (this.name, this.age);
}

final person = Person('안성우',24);

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
      routes: {
        '/first':(context) => FirstPage(),
        '/second':(context) => SecondPage(person: person),
      },
    );
  }
}



class FirstPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      body: ElevatedButton(
        child: Text(' 다음 페이지로'),
        onPressed: () async{
          final result = await Navigator.pushNamed(context, '/second');

          print(result);
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget{
  final Person person;

  SecondPage({required this.person});

  Widget  build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: ElevatedButton(
        child: Text('이전 페이지로'),
        onPressed: () {
          Navigator.pop(context,'ok');
        },
      ),
    );
  }
}