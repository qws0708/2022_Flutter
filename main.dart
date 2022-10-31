import 'package:flutter/material.dart';
import 'login_app/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase login app',
      home: LogIn(),
    );
  }
}

//
// class LogIn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: const Text(
//           'Sign In',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         elevation: 0.2,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ButtonTheme(
//               height: 50.0,
//               child: ElevatedButton(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   //spaceEvenly 위제 내의 그림,글 등을 같은 간격으로 배치
//                   children: <Widget>[
//                     Image.asset('images/glogo.png'),
//                     Text(
//                       'Login with Google',
//                       style: TextStyle(color: Colors.black87, fontSize: 15.0),
//                     ),
//                     Opacity(
//                       //투명도 결정
//                       opacity: 0.0,
//                       child: Image.asset('images/glogo.png'),
//                     ),
//                   ],
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                 ),
//                 onPressed: () {},
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(4.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             ButtonTheme(
//               height: 50.0,
//               child: ElevatedButton(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Image.asset('images/flogo.png'),
//                     Text(
//                       'Login with Facebook',
//                       style: TextStyle(color: Colors.white, fontSize: 15.0),
//                     ),
//                     Opacity(
//                       opacity: 0.0,
//                       child: Image.asset('images/glogo.png'),
//                     ),
//                   ],
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF334D92),
//                 ),
//                 onPressed: () {},
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(4.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             ButtonTheme(
//               height: 50.0,
//               child: ElevatedButton(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Icon(
//                       Icons.mail,
//                       color: Colors.white,
//                     ),
//                     Text(
//                       'Login with Email',
//                       style: TextStyle(color: Colors.white, fontSize: 15.0),
//                     ),
//                     Opacity(
//                       opacity: 0.0,
//                       child: Icon(
//                         Icons.mail,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                 ),
//                 onPressed: () {},
//               ),
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(4.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
