import 'package:http/http.dart' as http;
import 'dart:convert';  //jsonDecode 사용 가능

class Network{
  final  String url;
  Network(this.url);

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(
        Uri.parse(url));
    // Response : 어떤 요구에 대해서 응답되는 본문이 이미 알려져 있음, async방식으로 작동
    if (response.statusCode == 200) { //값이 200이면 올바르게 실행됨
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}