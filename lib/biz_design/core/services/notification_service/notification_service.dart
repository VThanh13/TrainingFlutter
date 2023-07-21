import 'dart:convert';

import 'package:dio/dio.dart';

class NotificationService {
  Dio dio = Dio();

  Future<Response<List<dynamic>>> getNotification(String url) async {
    final res = await dio.get<List<dynamic>>(
      url,
      options: Options(
        receiveTimeout: const Duration(milliseconds: 10000),
        sendTimeout: const Duration(milliseconds: 10000),
      ),
    );
    return res;
  }

  Future<Response<Map<String, dynamic>>> updateNotification(
      String url, Map<String, dynamic> data) async {
    final res = dio.put<Map<String, dynamic>>(
      url,
      data: jsonEncode(data),
      options: Options(
        receiveTimeout: const Duration(milliseconds: 10000),
        sendTimeout: const Duration(milliseconds: 10000),
      ),
    );
    return res;
  }

  Future<Response<Map<String, dynamic>>> createNotification(
      String url, Map<String, dynamic> data) async {
    final res = await dio.post<Map<String, dynamic>>(
      url,
      data: jsonEncode(data),
      options: Options(
        receiveTimeout: const Duration(milliseconds: 10000),
        sendTimeout: const Duration(milliseconds: 10000),
      ),
    );
    return res;
  }

  Future<Response<Map<String, dynamic>>> deleteNotification(String url) async {
    final res = await dio.delete<Map<String, dynamic>>(
      url,
      options: Options(
        receiveTimeout: const Duration(milliseconds: 10000),
        sendTimeout: const Duration(milliseconds: 10000),
      ),
    );
    return res;
  }
}
