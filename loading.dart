import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

//geolocator를 설치하고 yaml파일의 cupertino_icons 밑에 geolocator: ^9.0.2를 복사해서 붙여준 후 import해줌

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getLocation() async{
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }
//GPS를 통해서 async방식으로 현재 나의 위치를 불러 올 수 있음 -> 불러 온 위치값은 position에 담김

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          getLocation();
        },
        child: const Text('Get my location'),
      )),
    );
  }
}
