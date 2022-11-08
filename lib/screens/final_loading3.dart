import 'package:chef14/screens/final_weather_screen_UI.dart';
import 'package:flutter/material.dart';
import 'package:chef14/data/final_my_loacation.dart';
import 'package:chef14/data/final_network.dart';


const apikey = '5f80cb6424cbf6e7ea8369913898fb0f';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double latitude3;
  late double longitude3;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric',
        'http://api.openweathermap.org/data/2.5/air_pollution?lat=$latitude3&lon=$longitude3&appid=$apikey');

    var weatherData = await network.getJsonData();
    print(weatherData);

    var airData = await network.getAirData();
    print(airData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
        parseAirPollution: airData,
      );
    }));
  }

//   void fetchData() async{
//
//       var myJson = parsingData['weather'][0]['description'];  //jsonDecode의 타입은 dynamic이기에 var형태로 변수 생성 해야함
//       print(myJson);
//       var myJson2 = parsingData['wind']['speed'];
//       print(myJson2);
//       var myJson3 = parsingData['sys']['id'];
//       print(myJson3);
//     }else{
//       print(response.statusCode);
//     }
//     //print(response.body);
//     // 본문 전체를 가지고 오기 위해서는 .body
//     // JSON : JavaScript Object Notation(키값과 Value값을 가지는 형식) 형식의 데이터를 불러옴
//   }
// //GPS를 통해서 async방식으로 현재 나의 위치를 불러 올 수 있음 -> 불러 온 위치값은 position에 담김

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
