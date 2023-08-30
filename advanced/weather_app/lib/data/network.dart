import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  late final String url;

  Network(this.url);

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    } else {
      print('네트워크 오류가 발생했습니다');
    }
  }
}
