import 'package:flutter/material.dart';
import 'package:chef11/Dice.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller =
      TextEditingController(); //TextField의 값을 불러옴
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Builder(
        builder:(context) => GestureDetector(  //사용자의 탭에 반응하는 위젯
          onTap: (){
            FocusScope.of(context).unfocus();  //화면 전체의 focus를 해제함  -> 화면의 빈 공간을 누르면 키보드가 사라짐
          },
          child: SingleChildScrollView(
              // 키보드가 밑에서 밀고 올라오면서 스크린 영역을 차지할 때 그 영역만큼 스크린을 스크롤 할 수 있도록 도와주는 위젯
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  const Center(
                    child: Image(
                      image: AssetImage('image/chef.gif'),
                      width: 170.0,
                      height: 190.0,
                    ),
                  ),
                  //text 필드로 어떤 정보들을 입력받는 화면을 구성
                  Form(
                    child: Theme(
                      data: ThemeData(
                          primaryColor: Colors.teal,
                          inputDecorationTheme: const InputDecorationTheme(
                              labelStyle:
                              TextStyle(color: Colors.teal, fontSize: 15.0))),
                      child: Container(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: controller,
                              //TextEditing controller의 변수에 값을 불러옴
                              decoration: const InputDecoration(labelText: 'Enter "dice"'),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: controller2,
                              decoration:
                              const InputDecoration(labelText: 'Enter Password'),
                              keyboardType: TextInputType.text,
                              obscureText: true, //비밀번호 입력시 *로 가려줌
                            ),
                            const SizedBox(height: 40.0),
                            ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orangeAccent),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                                onPressed: () {
                                  if (controller.text == 'dice' &&
                                      controller2.text == '1234') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext) => Dice()));
                                  }else if(controller.text == 'dice' &&
                                      controller2.text != '1234'){
                                    showSnackBar2(context);
                                  }else if(controller.text != 'dice' &&
                                      controller2.text == '1234'){
                                    showSnackBar3(context);
                                  }else{
                                    showSnackBar(context);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context){

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('로그인 정보를 다시 확인하세요',
    textAlign: TextAlign.center,),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    )
  );
}

void showSnackBar2(BuildContext context){

  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('비밀번호가 일치하지 않습니다',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}

void showSnackBar3(BuildContext context){

  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('dice의 철자를 확인하세요',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      )
  );
}
