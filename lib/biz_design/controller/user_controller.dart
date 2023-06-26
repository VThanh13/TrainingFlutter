import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/services/user_services/user_service.dart';
import '../models/user_model/user_model.dart';

class UserController extends GetxController {
  RxBool isInternetConnect = true.obs;
  late UserModel userModel;
  List<String> list = [];

  Future<void> getUserInfo() async {
    String url = 'https://649143fe2f2c7ee6c2c7e76a.mockapi.io/api/user/1';
    isInternetConnectFunc();
    final user = await UserService().getUser(url);
    if (user.statusCode == 200) {
      userModel = UserModel(
          businessComment: List<String>.from(user.data!['businessComment']),
          industryConnect: List<String>.from(user.data!['industryConnect']),
          area: List<String>.from(user.data!['area']),
          career: Map<String, String>.from(user.data!['career']),
          personSkill: List<String>.from(user.data!['personSkill']),
          qualification: user.data!['qualification'],
          director: user.data!['director'],
          annualIncome: user.data!['annualIncome'],
          asset: user.data!['asset'],
          placeOfBirth: user.data!['placeOfBirth'],
          hobby: user.data!['hobby'],
          id: user.data!['id']);
      //print(userModel.career.containsKey(userModel.career.keys));
      userModel.career.forEach(
        // ignore: unnecessary_set_literal
        (key, value) => {
          list.add('$key: $value'),
        },
      );
    }
  }

  isInternetConnectFunc() async {
    isInternetConnect.value = await InternetConnectionChecker().hasConnection;
  }

  @override
  void onInit() {
    isInternetConnectFunc();
    super.onInit();
    getUserInfo();
  }
}
