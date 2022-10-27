import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';  //fluttertoast 최신버전을 yaml파일에 등록하고 import하여야 사용 가능

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {

  int lefDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Dice game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  //주축성분(세로)를 중앙으로 위치시킴
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,  //주축성분(가로)를 중앙으로 위치시킴
                children: <Widget>[
                  Expanded(
                      child: Image.asset('image/dice$lefDice.png')  //변수의 값을 붙여줌 dice1 = dice$leftDice
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  // Image.asset('image/dice1.png') = Image(image: AssetImage('image/dice1.png'))
                  Expanded(
                      child: Image.asset('image/dice$rightDice.png')
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 60,
            ),

            ButtonTheme(
              minWidth: 100,
              height: 60,
              child: ElevatedButton(
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent),
                  onPressed: (){
                  setState(() {
                    lefDice = Random().nextInt(6) +1;
                    rightDice = Random().nextInt(6) +1;
                  });
                  showToast(
                   'Left dice: {$lefDice}, Right'
                  );

                  }),
            ),
          ],
        ),
      ),
    );
  }
}

void showToast(String message){
  Fluttertoast.showToast(msg: message,
    backgroundColor: Colors.blue,
    toastLength: Toast.LENGTH_SHORT, //지속 시간
    gravity: ToastGravity.BOTTOM  //출력 위치
  );

}
