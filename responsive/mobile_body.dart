import 'package:flutter/material.dart';

class mobileBody extends StatelessWidget {
  const mobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile'),
      ),
      backgroundColor: Colors.deepPurple[200],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 300,
              color: Colors.deepPurple[400],
            ),
          ),
          Expanded(  //Colum위젯 내에서 ListView를 사용하면 세로 방향으로 가능한 모든 공간을 차지하려 하는데 Colum위젯은 height에 어떤 제약도 두지 않아 ListView위젯 사이즈의 계산이 불가해짐
                    // ListView를 Expanded로 감싸주면 ListView는 Colum위젯이 허용하는 범위 내에서 차지할 수 있는 모든 공간을 차지하여 ListView위젯 사이즈가 계산 가능해 짐.
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.deepPurple[300],
                      height: 120,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
