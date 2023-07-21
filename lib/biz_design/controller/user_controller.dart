import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/blocs/profile_bloc/profile_bloc.dart';
import '../core/services/user_services/user_service.dart';
import '../models/user_model/user_model.dart';

class UserController {
  bool isInternetConnect = true;
  UserModel userModel = UserModel(
      businessComment: [],
      industryConnect: [],
      area: [],
      career: {},
      personSkill: [],
      qualification: '',
      director: '',
      annualIncome: '',
      asset: '',
      placeOfBirth: '',
      hobby: '',
      id: '');
  List<String> list = [];

  ProfileBloc profileBloc = ProfileBloc();

  final _baseUrl = 'https://649143fe2f2c7ee6c2c7e76a.mockapi.io/api/user';

  Future<void> getUserInfo() async {
    try {
      String url = '$_baseUrl/1';
      final response = await UserService().getUser(url);
      if (response.statusCode == 200) {
        userModel = UserModel.fromJson(response.data!);
        userModel.career.forEach(
          // ignore: unnecessary_set_literal
          (key, value) => {
            list.add('$key: $value'),
          },
        );
      } else {
        // ignore: avoid_print
        print('API failed with status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.receiveTimeout) {
        // ignore: avoid_print
        print('API call timeout');
      } else {
        // ignore: avoid_print
        print('API call failed with error: $e');
      }
    } catch (e) {
      // ignore: avoid_print
      print('API call failed with exception: $e');
    }
  }

  isInternetConnectFunc() async {
    isInternetConnect = await InternetConnectionChecker().hasConnection;
  }
}
