import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:chef14/model/final_model.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData, this.parseAirPollution});

  final dynamic parseWeatherData;
  final dynamic parseAirPollution;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Model model = Model();
  late String cityName;
  late int temp;
  Widget? icon;
  late String des;
  Widget? airIcon;
  Widget? airState;
  late double dust1; //미세먼지
  late double dust2; //초미세먼지


  var date = DateTime.now(); //날짜를 저장하는 변수

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData, widget.parseAirPollution);
  }

  void updateData(dynamic weatherData, dynamic airData) {
    double temp2 = weatherData['main']['temp']; //현재 온도(화씨로 출력됨)
    int condition = weatherData['weather'][0]['id']; //condition변수의 값으로 JSON데이터의 id값을 받아옴
    int index = airData['list'][0]['main']['aqi'];
    des = weatherData['weather'][0]['description'];
    temp = temp2.toInt(); //double형의 temp2를 int형의 temp로 변환해줌
    cityName = weatherData['name'];//나의 위치값 : 서울
    icon = model.getWeatherIcon(condition);
    airIcon = model.getAirIcon(index);
    airState = model.getAirCondition(index);
    dust1 = airData['list'][0]['components']['pm10'];
    dust2 = airData['list'][0]['components']['pm2_5'];

  }

  String getSystemTime() {
    //시간 불러오는 함수 //String타입의 변수는 return값이 반드시 있어야 함
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, //body를 appbar 뒤까지 확장
      appBar: AppBar(
        backgroundColor: Colors.transparent, //transparent : 투명한
        elevation: 0.0,
        leading: IconButton(
          //좌측에 아이콘 배치
          icon: const Icon(Icons.near_me),
          onPressed: () {},
          iconSize: 30.0,
        ),
        actions: [
          //우측에 아이콘 배치
          IconButton(
            icon: const Icon(Icons.location_searching),
            onPressed: () {},
            iconSize: 30.0,
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 150.0,
                            ),
                            Text(
                              '$cityName',
                              style: GoogleFonts.lato(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                TimerBuilder.periodic(
                                  (Duration(minutes: 1)),
                                  builder: (context) {
                                    //builder위젯은 return값을 반드시 받아야함
                                    print('${getSystemTime()}');
                                    return Text(
                                      //시간
                                      '${getSystemTime()}',
                                      style: GoogleFonts.lato(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  //요일
                                  DateFormat('- EEEE').format(date),
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  //날짜
                                  DateFormat('- d MMM, yyy').format(date),
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$temp\u2103',
                              style: GoogleFonts.lato(
                                  fontSize: 85.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                icon!,
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '$des',
                                  style: GoogleFonts.lato(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(
                        height: 15.0,
                        thickness: 2.0,
                        color: Colors.white30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'AQI(대기질 지수)',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              airIcon!,
                              const SizedBox(
                                height: 10.0,
                              ),
                              airState!,
                            ],
                          ),

                          Column(
                            children: [
                              Text(
                                '미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$dust1',
                                style: GoogleFonts.lato(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                ' ㎍/㎥',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Text(
                                '초미세먼지',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$dust2',
                                style: GoogleFonts.lato(
                                  fontSize: 24.0,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                ' ㎍/㎥',
                                style: GoogleFonts.lato(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
