import 'dart:developer';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/db_helper/user_helper/user.dart';
import '../core/services/user_services/user_service.dart';
import '../models/user_model/user_model.dart';

class UserController extends GetxController {
  RxList<UserModel> users = RxList();
  RxBool isInternetConnect = true.obs;
  late User _user;
  UserController() {
    _user = User();
  }

  saveUser(UserModel userModel) async {
    return await _user.insertData('user', userModel.userMap());
  }

  readUser() async {
    return await _user.readData('user');
  }

  List<UserModel> getDatas = [];

  var url = 'https://649143fe2f2c7ee6c2c7e76a.mockapi.io/api/user';

  getUsers() async {
    isInternetConnectFunc();
    var response = await UserService().getUser(url);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        users.add(UserModel.fromJson(element));
      });
    }
  }

  saveData() async {
    final userController = UserController();
    var user = UserModel();
    getDatas.clear();
    getDatas = users;
    for (int i = 0; i < getDatas.length;) {
      user.businessComment = getDatas[i].businessComment;
      user.industryConnect = getDatas[i].industryConnect;
      user.area = getDatas[i].area;
      user.career = getDatas[i].career;
      user.personSkill = getDatas[i].personSkill;
      user.director = getDatas[i].director;
      user.annualIncome = getDatas[i].annualIncome;
      user.asset = getDatas[i].asset;
      user.placeOfBirth = getDatas[i].placeOfBirth;
      user.hobby = getDatas[i].hobby;
      user.id = getDatas[i].id;
      userController.saveUser(user);
      log('message');
      log(getDatas[1].placeOfBirth.toString());
      return getDatas;
    }
  }

  isInternetConnectFunc() async {
    isInternetConnect.value = await InternetConnectionChecker().hasConnection;
  }

  @override
  void onInit() {
    getUsers();
    isInternetConnectFunc();
    super.onInit();
    saveData();
  }
}
