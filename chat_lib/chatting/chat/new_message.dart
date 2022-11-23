import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {

  final _controller = TextEditingController();
  var _userEnterMessage = '';
  void _sendMessage(){
    FocusScope.of(context).unfocus();
    FirebaseFirestore.instance.collection('chat').add({
      'text' : _userEnterMessage,
      'time' : Timestamp.now()
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              //메세지 보내기
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a message...'),
              onChanged: (value) {
                setState(() {
                  _userEnterMessage = value;   //모든 키 입력에서 setState가 활성화 됨
                });
              },
            ),
          ),
          IconButton(
            onPressed: _userEnterMessage.trim().isEmpty ? null : _sendMessage,
            //메서드 뒤에() 있음 : 메서드가 실행된다는 의미, 매서드 값이 리턴된다는 의미
            //메서드 뒤에() 없음 : 위치를 참조한다는 의미  _sendMessage
            icon: const Icon(Icons.send),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
