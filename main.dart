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
enum Gender {MAN , WOMAN}

class MyHomePage extends StatefulWidget{

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
   Gender _gender = Gender.MAN;

   Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         title: Text('Radio / RadioListTile'),
       ),
       body: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               ListTile(
                 title: Text('남자'),
                 leading: Radio(
                   value: Gender.MAN,
                   groupValue: _gender,
                   onChanged: (value){
                     setState(() {
                       _gender = value;
                     });
                   },
                 ),
               ),
               ListTile(
                 title: Text('여자'),
                 leading: Radio(
                   value: Gender.WOMAN,
                   groupValue: _gender,
                   onChanged: (value){
                     setState(() {
                       _gender = value;
                     });
                   },
                 ),
               ),
               SizedBox(
                 height: 40,
               ),
               RadioListTile(
                 title: Text('남자'),
                   value: Gender.MAN,
                   groupValue: _gender,
                   onChanged: (value){
                     setState(() {
                       _gender = value;
                     });
                   },
               ),
               RadioListTile(
                 title: Text('여자'),
                 value: Gender.WOMAN,
                 groupValue: _gender,
                 onChanged: (value){
                   setState(() {
                     _gender = value;
                   });
                 },
               ),
             ],
           ),
         ),
       ),
     );
   }
}