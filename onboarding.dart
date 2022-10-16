import 'package:chef6/main.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the frist page\n'
              'We are making on-boarding screens\n'
              'It is very interesting',
          image: Image.asset('image/page1.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the second page\n'
              'We are making on-boarding screens\n'
              'It is very interesting',
          image: Image.asset('image/page2.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the thrid page\n'
              'We are making on-boarding screens\n'
              'It is very interesting',
          image: Image.asset('image/page3.png'),
          decoration: getPageDecoration(),
        ), //페이지 구성 담당
      ],
      done: const Text('Done'), // 버튼 윗제 중에 하나
      onDone: () {
        //onPressed와 동일
        Navigator.of(context).pushReplacement(  //.push대신 .pushReplacement 사용시 페이지 appbar에 뒤로 가기 버튼 없어짐
          MaterialPageRoute(builder: (context) => const MyPage()),
        );
      },
      next: const Icon(Icons.arrow_forward),
      showSkipButton:  true,  //skip버튼 활성화
      skip: const Text('skip'),
      dotsDecorator: DotsDecorator(  // 하단에 페이지 나타내는 점 설정
        color: Colors.cyan,  //cyan(청록색)
        size: const Size(10,10),
        activeSize: const Size(22,10),  //해당 페이지를 나타내는 점의 가로 길이를 22로 변경
        activeShape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
        ),
        activeColor: Colors.red,  //활성화 된 점의 색상 지정
      ),
      curve: Curves.bounceOut,  //페이지 넘길 때 애니메이션 효과 추가
    );
  }

  PageDecoration getPageDecoration() {   //PageDecoration 속성들은 필요한 것들만 불러서 사용가능하도록 네임드 알규먼트로 구성되어있어 별다른 인자값 필요X
   //PageDecoration의 getPageDecoration()라는 메서드를 만들어 필요할 때마다 불러서 사용
    return PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(fontSize: 18, color: Colors.blue),
        imagePadding: EdgeInsets.only(top: 40),
        pageColor: Colors.orange);
  }
}
