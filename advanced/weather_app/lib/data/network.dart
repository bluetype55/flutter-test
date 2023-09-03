import 'dart:convert';

import 'package:http/http.dart' as http;

// static const String baseUrl =
//       "https://webtoon-crawler.nomadcoders.workers.dev";
//   static const String today = "today";

//   static Future<List<WebtoonModel>> getTodaysToons() async {
//     List<WebtoonModel> webtoonInstances = [];
//     final url = Uri.parse('$baseUrl/$today');
//     final response = await http.get(url);

class Network {
  late final String url;
  late final String url2;
  Network(this.url, this.url2);

  Future<dynamic> getJsonData() async {
    Uri uri = Uri.parse(url);
    print('uri: $uri');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    } else {
      print('날씨 데이터: 오류발생');
    }
  }

  Future<dynamic> getAirData() async {
    http.Response response = await http.get(Uri.parse(url2));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    } else {
      print('미세먼지 데이터: 오류 발생');
    }
  }
}
