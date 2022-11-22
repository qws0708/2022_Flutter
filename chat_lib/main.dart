import 'package:chef15/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chef15/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  //flutter에서 firebase를 사용하기 위해 최초에 불러와야하는 초기화 메서드인 Firebase.initializeApp()메서드는 비동기 방식으로 작동함
  //Firebase.initializeApp()은 flutter와 통신을 원하지만 플러터의 최상위 메서드인 runApp메서드가 호출 되전에는 플러터 엔진이 초기화되지 않아 접근이 불가함
  //Firebase.initializeApp()을 사용하기 위해서 runApp이 작동하기전에 초기화해야하는데 이를 도와줌
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        //Authentication state와 관련해서 authentication state가 바뀔 때 이를 구독하기 위한 3가지 메서드 중 하나
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const ChatScreen();
          }
          return const LoginSignupScreen();
        },
      ),
    );
  }
}
