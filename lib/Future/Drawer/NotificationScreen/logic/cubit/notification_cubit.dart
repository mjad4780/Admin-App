import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../models/Notification.dart';
import '../../../../../models/notification_result.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  final sendNotificationFormKey = GlobalKey<FormState>();

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController imageUrlCtrl = TextEditingController();

  NotificationResult? notificationResult;

  List<NotificationModel> allNotifications = [
    NotificationModel(
        title: 'mpohamed',
        body: 'hi mohamed',
        datetime: '2000-3-22',
        image: 'assets/icons/delivery1.svg')
  ];
  List<NotificationModel> filteredNotifications = [];

  int? totalSend;
  int? totalOpened;
  int? totalFailed;
  int? totalError;
  hhh() {
    totalSend = notificationResult?.successDelivery ?? 0;
    totalOpened = notificationResult?.openedNotification ?? 0;
    totalFailed = notificationResult?.failedDelivery ?? 0;
    totalError = notificationResult?.erroredDelivery ?? 0;
  }

  double calculatePercentage(int notificationCount) {
    if (totalSend == 0) {
      return 0;
    } else {
      return (notificationCount / totalSend!) * 100;
    }
  }
}
