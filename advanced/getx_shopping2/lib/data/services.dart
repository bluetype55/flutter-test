import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class Services {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    String url =
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';
    var response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jasonData = response.body;
      return productFromJson(jasonData);
    } else {
      return null;
    }
  }
}
