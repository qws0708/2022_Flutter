import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser; //값을 초기화하지 않기 때문에 nullable탑입임을 ?로 나타냄

  @override
  void initState() {
    //페이지가 이동될 때마다 getCurrentUser()를 불러와야 하므로 initState로 감싸준다
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat screen'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.exit_to_app_sharp,
              color: Colors.white,
            ),
            onPressed: (){    //로그아웃 기능 구현
              _authentication.signOut();
              Navigator.pop(context);
          },
          ),
        ],
      ),
      body: const Center(
        child: Text('Chat screen'),
      ),
    );
  }
}
