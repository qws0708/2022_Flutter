import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyKey(),
    );
  }
}

class MyKey extends StatelessWidget {
  final counterkey = GlobalKey<_CounterState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Globalkey'),
      ),
      body: Center(
        child: Counter(
          key: counterkey,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: (){
          counterkey.currentState?.increment();

        },
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  void increment(){
    setState(() {
      count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          'Count number: $count',
      style: const TextStyle(
        fontSize: 20.0,
      ),),
    );
  }
}

