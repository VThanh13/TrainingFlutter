import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/services/notification_service/notification_service.dart';
import '../models/notification_model/notification_model.dart';

class NotificationController extends GetxController {
  RxList<NotificationModel> notifications = RxList();
  RxBool isInternetConnect = true.obs;

  Future<void> getNotifications() async {
    String url = 'https://649143fe2f2c7ee6c2c7e76a.mockapi.io/api/post';
    isInternetConnectFunc();
    final response = await NotificationService().getNotification(url);
    if (response.statusCode == 200) {
      notifications.clear();
      notifications.addAll(
          (response.data ?? []).map((e) => NotificationModel.fromJson(e)));
    }
  }

  Future<void> updateNotification(String id, Map<String, dynamic> data) async {
    String url = 'https://649143fe2f2c7ee6c2c7e76a.mockapi.io/api/post/$id';
    isInternetConnectFunc();
    await NotificationService().updateNotification(url, data);
    // ignore: avoid_print
    print('Update notification success');
  }

  Future<void> createNotification(Map<String, dynamic> data) async {
    String url = 'https://649143fe2f2c7ee6c2c7e76a.mockapi.io/api/post';
    isInternetConnectFunc();
    await NotificationService().createNotification(url, data);
    // ignore: avoid_print
    print('Create notification success');
  }

  Future<void> deleteNotification(String id) async {
    String url = 'https://649143fe2f2c7ee6c2c7e76a.mockapi.io/api/post/$id';
    isInternetConnectFunc();
    await NotificationService().deleteNotification(url);
    // ignore: avoid_print
    print('Delete notification success');
  }

  Future<void> isInternetConnectFunc() async {
    isInternetConnect.value = await InternetConnectionChecker().hasConnection;
  }

  @override
  void onInit() {
    isInternetConnectFunc();
    getNotifications();
    super.onInit();
  }
}
