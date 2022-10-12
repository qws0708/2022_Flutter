import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  Widget build(BuildContext context){

    return MaterialApp(
      title: 'AppBar',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget{

  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar icon menu'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[//복수의 아이콘 버튼 등을 오른쪽에 배치할 때 사용
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              print('shopping cart button is clicked');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search button is clicked');
            },
          ),
        ],
      ),
      drawer: Drawer( //햄버거 버튼
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(  //Drawer의 윗부분
              currentAccountPicture: CircleAvatar( //죄측 상단에 1개의 이미지 생성
                backgroundImage: AssetImage('asset/11.PNG'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: <Widget>[ // 우측 상단에 여러개의 이미지 생성 가능
                CircleAvatar(
                  backgroundImage: AssetImage('asset/22.PNG'),
                  backgroundColor: Colors.white,
                ),
              ],
              accountName: Text('BBANTO'),  //UserAccountsDrawerHeader을 ctrl누르고 클릭하면 requred라고 나오는데 이것은 무조건 필요한 속성임
              accountEmail: Text('BBANTO@bbanto.com'), //그 속성이 accountName이랑 accountEmail이라고 나옴 -> 확인해 볼 것.
              onDetailsPressed: (){
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, //아이콘이나 이미지를 좌측 끝에 배치
                color: Colors.grey[850],
              ),
              title: Text('home'),
              onTap: (){
                print('Home is Clicked');
              },
               trailing: Icon(Icons.add), //아이콘이나 이미지를 우측 끝에 배치
            ),
            ListTile(
              leading: Icon(Icons.settings, //아이콘이나 이미지를 좌측 끝에 배치
                color: Colors.grey[850],
              ),
              title: Text('Settings'),
              onTap: (){
                print('Settings is Clicked');
              },
               trailing: Icon(Icons.add), //아이콘이나 이미지를 우측 끝에 배치
            ),
            ListTile(
              leading: Icon(Icons.question_answer, //아이콘이나 이미지를 좌측 끝에 배치
                color: Colors.grey[850],
              ),
              title: Text('Q&A'),
              onTap: (){
                print('Q&A is Clicked');
              },
               trailing: Icon(Icons.add), //아이콘이나 이미지를 우측 끝에 배치
            ),
          ],
        ),
      ),
    );
  }
}