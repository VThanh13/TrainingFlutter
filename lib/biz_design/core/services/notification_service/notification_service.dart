import 'dart:convert';

import 'package:dio/dio.dart';

class NotificationService {
  Dio dio = Dio();

  Future<Response<List<dynamic>>> getNotification(String url) async {
    final res = await dio.get<List<dynamic>>(
      url,
      options: Options(responseType: ResponseType.json, method: "GET"),
    );
    return res;
  }

  Future<Response<Map<String, dynamic>>> updateNotification(
      String url, Map<String, dynamic> data) async {
    final res = dio.put<Map<String, dynamic>>(url,
        options: Options(responseType: ResponseType.json, method: "PUT"),
        data: jsonEncode(data));
    return res;
  }

  Future<Response<Map<String, dynamic>>> createNotification(
      String url, Map<String, dynamic> data) async {
    final res = await dio.post<Map<String, dynamic>>(url,
        options: Options(responseType: ResponseType.json, method: "POST"),
        data: jsonEncode(data));
    return res;
  }

  Future<Response<Map<String, dynamic>>> deleteNotification(String url) async {
    final res = await dio.delete<Map<String, dynamic>>(
      url,
      options: Options(responseType: ResponseType.json, method: "DELETE"),
    );
    return res;
  }
}
