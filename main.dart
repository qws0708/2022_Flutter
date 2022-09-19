import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

final items=List.generate(100,(i)=>i).toList();

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('시발'),
      ),

      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            trailing: Icon(Icons.navigate_next),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Event'),
            trailing: Icon(Icons.navigate_next),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('Camera'),
            trailing: Icon(Icons.navigate_next),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}