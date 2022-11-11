import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(
  new MaterialApp(
    home: PositionedTile(),
  ),
);

class PositionedTile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTileState();
}

class PositionedTileState extends State<PositionedTile> {
  List<Widget> tiles = [
    StatefulColorfulTitle(key: UniqueKey(),),
    StatefulColorfulTitle(key: UniqueKey(),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: tiles,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.double_arrow_rounded),
          onPressed: (){
            swapTiles();
            flutterToast();
          }
      ),
    );
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));   //list의 0번 자리 타일을 삭제하여 1번 자리 타일을 0번자리로 옮긴 후 1번 자리에 삭제된 0번 타일을 추가
    });
  }
}

class StatefulColorfulTitle extends StatefulWidget {
  const StatefulColorfulTitle({super.key});
  // stl 위젯은 elemttree에 정보가 저장되어 key가 없어도 무방하나 stf위젯은 state 객체에 정보가 저장되어 key값을 부여해서 정보를 확인해야 한다
  @override
  State<StatefulColorfulTitle> createState() => _StatefulColorfulTitleState();
}

class _StatefulColorfulTitleState extends State<StatefulColorfulTitle> {
  Color myColor = getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      child: const Padding(
        padding: EdgeInsets.all(70.0),
      ),

    );
  }
}


getRandomColor() {
  var r = Random();
  return Color.fromARGB(255, r.nextInt(255), r.nextInt(255), r.nextInt(255));
}

void flutterToast() {
  Fluttertoast.showToast(
      msg: 'Color has been changed',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT
  );
}