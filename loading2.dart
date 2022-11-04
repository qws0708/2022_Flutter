import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';  //jsonDecode 사용 가능

//geolocator를 설치하고 yaml파일의 cupertino_icons 밑에 geolocator: ^9.0.2를 복사해서 붙여준 후 import해줌

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {  //App을 실행하자마자 tree에 넣어주는 단계에서 위치를 불러와 보여줌
    super.initState();
    getLocation();
    fetchData();
  }

  void getLocation() async{
    try { //try catch구문 : 예외 상활 처리
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    } on Exception catch (e) {
      print('인터넷 연결에 문제가 발생했습니다');
    }
  }
  
  void fetchData() async{
    http.Response response = await http.get(Uri.parse('https://samples.openweathermap.org/data/2.5/weather?'
        'q=London&appid=b1b15e88fa797225412429c1c50c122a1'));
    // Response : 어떤 요구에 대해서 응답되는 본문이 이미 알려져 있음, async방식으로 작동
    if(response.statusCode == 200){  //값이 200이면 올바르게 실행됨
      String jsonData = response.body;
      var myJson = jsonDecode(jsonData)['weather'][0]['description'];  //jsonDecode의 타입은 dynamic이기에 var형태로 변수 생성 해야함
      print(myJson);
      var myJson2 = jsonDecode(jsonData)['wind']['speed'];
      print(myJson2);
      var myJson3 = jsonDecode(jsonData)['sys']['id'];
      print(myJson3);

    }
    //print(response.body);
    // 본문 전체를 가지고 오기 위해서는 .body
    // JSON : JavaScript Object Notation(키값과 Value값을 가지는 형식) 형식의 데이터를 불러옴
  }
//GPS를 통해서 async방식으로 현재 나의 위치를 불러 올 수 있음 -> 불러 온 위치값은 position에 담김

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: null,
        child: const Text('Get my location'),
      )),
    );
  }
}
