import 'dart:developer';

import 'package:dio/dio.dart';

class NotificationService {
  Dio dio = Dio();

  Future<dynamic> getNotification(String url) async {
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

  Future<dynamic> updateNotification(String url, dynamic data) async {
    return await dio.put(url,
        options: Options(responseType: ResponseType.json, method: "PUT"),
        data: data);
  }

  Future<dynamic> createNotification(String url, dynamic data) async {
    return await dio.post(url,
        options: Options(responseType: ResponseType.json, method: "POST"),
        data: data);
  }
}
