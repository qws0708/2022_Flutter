import 'package:geolocator/geolocator.dart';

class MyLocation{
  late double latitude2;
  late double longitude2;

  Future<void> getMyCurrentLocation()async{

    try { //try catch구문 : 예외 상활 처리
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(latitude2);
      print(longitude2);
    } on Exception catch (e) {
      print('인터넷 연결에 문제가 발생했습니다');
    }

  }

}