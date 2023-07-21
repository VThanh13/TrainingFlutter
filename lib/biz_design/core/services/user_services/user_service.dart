import 'package:dio/dio.dart';

class UserService {
  Dio dio = Dio();
  Future<Response<Map<String, dynamic>>> getUser(String url) async {
    final response = dio.get<Map<String, dynamic>>(
      url,
      options: Options(
        receiveTimeout: const Duration(milliseconds: 10000),
        sendTimeout: const Duration(milliseconds: 10000),
      ),
    );
    return response;
  }
}
