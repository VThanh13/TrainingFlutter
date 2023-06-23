import 'package:http/http.dart' as http;

import '../models/product.dart';

class RemoteService {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    const String url =
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';
    final uri = Uri.parse(url);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      throw Exception('Error');
    }
  }
}
