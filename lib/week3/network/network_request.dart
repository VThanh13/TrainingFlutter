import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/photos.dart';

class NetworkRequest {
  static const url = 'https://jsonplaceholder.typicode.com/photos';

  static List<Photos> parsePhotos(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Photos> photos = list.map((model) => Photos.fromJson(model)).toList();
    return photos;
  }

  static Future<List<Photos>> fetchPhotos({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(parsePhotos, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get photos');
    }
  }
}
