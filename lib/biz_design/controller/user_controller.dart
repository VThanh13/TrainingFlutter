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
      userModel = UserModel.fromJson(user.data!);
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
