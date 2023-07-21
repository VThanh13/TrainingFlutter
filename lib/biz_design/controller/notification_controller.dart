import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/services/notification_service/notification_service.dart';
import '../models/notification_model/notification_model.dart';

class NotificationController {
  List<NotificationModel> notifications = [];
  bool isInternetConnect = true;

  final _baseUrl = 'https://649143fe2f2c7ee6c2c7e76a.mockapi.io/api/post';
  List<NotificationModel> moreItems = [];
  bool isLoadMore = true;

  Future<void> getNotifications() async {
    try {
      final response = await NotificationService()
          .getNotification('$_baseUrl?page=1&limit=6');
      if (response.statusCode == 200) {
        notifications.clear();
        notifications.addAll(
            (response.data ?? []).map((e) => NotificationModel.fromJson(e)));
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

  Future<void> loadMoreNotification(int page) async {
    try {
      final response = await NotificationService()
          .getNotification('$_baseUrl?page=$page&limit=6');
      if (response.statusCode == 200) {
        if (response.data!.isNotEmpty) {
          isLoadMore = true;
          moreItems.clear();
          moreItems.addAll(
              (response.data ?? []).map((e) => NotificationModel.fromJson(e)));
          notifications.addAll(moreItems);
        } else {
          isLoadMore = false;
        }
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

  Future<void> updateNotification(String id, Map<String, dynamic> data) async {
    try {
      String url = '$_baseUrl/$id';

      await NotificationService().updateNotification(url, data);
      // ignore: avoid_print
      print('Update notification success');
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

  Future<void> createNotification(Map<String, dynamic> data) async {
    try {
      String url = _baseUrl;

      await NotificationService().createNotification(url, data);
      // ignore: avoid_print
      print('Create notification success');
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

  Future<void> deleteNotification(String id) async {
    try {
      String url = '$_baseUrl/$id';
      await NotificationService().deleteNotification(url);
      // ignore: avoid_print
      print('Delete notification success');
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

  Future<void> isInternetConnectFunc() async {
    isInternetConnect = await InternetConnectionChecker().hasConnection;
  }

  Future<void> refreshItems() async {
    notifications.clear();
    moreItems.clear();
    await getNotifications();
  }
}
