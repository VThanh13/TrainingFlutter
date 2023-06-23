import 'dart:developer';

import 'package:dio/dio.dart';

class UserService {
  Future<dynamic> getUser(String url) async {
    Dio dio = Dio();
    return await dio
        .get(
      url,
      options: Options(responseType: ResponseType.json, method: "GET"),
    )
        .then((response) {
      log(response.toString());
      return response;
    });
  }
}
