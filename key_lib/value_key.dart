import 'package:flutter/material.dart';
import 'dice.dart';

void main() => runApp(MyApp2());

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool emailField = true;

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Builder(
        builder:(context) {
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  const Center(
                    child: Image(
                      image: AssetImage('image/chef.gif'),
                      width: 170.0,
                      height: 190.0,
                    ),
                  ),
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
                              children: <Widget>[
                                if(emailField)
                                const TextField(
                                  key: ValueKey(1),
                                  //controller: controller,
                                  decoration:
                                  InputDecoration(labelText: 'Enter "dice"'),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const TextField(
                                  key: ValueKey(2),
                                  //controller: controller2,
                                  decoration:
                                  InputDecoration(labelText: 'Enter Password'),
                                  keyboardType: TextInputType.text,
                                  obscureText: false,
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                ButtonTheme(
                                    minWidth: 100.0,
                                    height: 50.0,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.purple,
                                          minimumSize: const Size(150.0, 50.0),
                                        ),
                                        child: const Icon(
                                          Icons.visibility_off,
                                          color: Colors.white,
                                          size: 35.0,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            emailField = false;
                                          });
                                        })),
                              ],
                            ),
                          )))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

