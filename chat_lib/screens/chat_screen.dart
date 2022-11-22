import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
            onPressed: () {
              //로그아웃 기능 구현
              _authentication.signOut();
              //Navigator.pop(context);
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/EPQwJY2cYbblO7kTljyh /asw')
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          //빌드와 스트림에서 가장 최신의 스냅샷을 가져오기 위한 AsyncSnapshot이라는 클래스를 가져야 함
          if(snapshot.connectionState == ConnectionState.waiting){
            //firebase에 접근해서 데이터를 가지고 올 동안 null인 상황에 적용
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = snapshot.data!.docs; //컬렉션 내의 데이터

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  docs[index]['text'],
                  style: const TextStyle(fontSize: 20.0),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
