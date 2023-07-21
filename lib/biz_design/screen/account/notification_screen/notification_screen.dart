import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/notification_controller.dart';
import '../../../core/blocs/notification_bloc/notification_bloc.dart';
import '../../../core/blocs/notification_bloc/notification_event.dart';
import '../../../core/blocs/notification_bloc/notification_state.dart';
import '../../../models/notification_model/notification_model.dart';
import 'notification_detail.dart';
import 'notification_edit.dart';
import 'notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationBloc notificationBloc = NotificationBloc();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    notificationBloc.add(NotificationInitialEvent());
  }

  NotificationController notificationController = NotificationController();

  late NotificationModel detail;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
        bloc: notificationBloc,
        listenWhen: (previous, current) => current is NotificationActionState,
        buildWhen: (previous, current) => current is! NotificationActionState,
        builder: (context, state) {
          if (notificationController.isInternetConnect == true) {
            if (state is NotificationLoadingState) {
              return const Center(
                child: SizedBox(
                    height: 30, width: 30, child: CircularProgressIndicator()),
              );
            } else if (state is ClickToDetailNotificationState) {
              return NotificationDetail(detail: detail);
            } else if (state is NotificationErrorState) {
              return const Text('Error!');
            } else if (state is ClickToEditNotificationState) {
              return const EditNotification(isEdit: false);
            }
            return const SingleChildScrollView(
              child: NotificationItem(),
            );
          } else {
            return const Center(
              child: Text('No internet'),
            );
          }
        },
        listener: (context, state) {});
  }
}
