import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/repo.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._notificationRepo)
      : super(const NotificationState.initial());
  final NotificationRepo _notificationRepo;
  final sendNotificationFormKey = GlobalKey<FormState>();

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController imageUrlCtrl = TextEditingController();

  ///:AddNotification
  addNotification() async {
    if (sendNotificationFormKey.currentState!.validate()) {
      emit(const NotificationState.loadingAdd());
      final response = await _notificationRepo.addNotification(
          titleCtrl.text, descriptionCtrl.text, imageUrlCtrl.text);
      response.when(success: (data) {
        emit(const NotificationState.successAdd());
      }, failure: (error) {
        emit(NotificationState.erorrAdd(erorr: error.messege ?? ''));
      });
    }
  }

  ///:viewNotification
  viewNotification() async {
    emit(const NotificationState.loadingView());
    final response = await _notificationRepo.viewNotification();
    response.when(success: (data) {
      emit(NotificationState.successView(data));
    }, failure: (error) {
      emit(NotificationState.erorrView(erorr: error.messege ?? ''));
    });
  }

  ///:viewNotification
  viewAnalysis(String id) async {
    emit(const NotificationState.loadingViewAnalysis());
    final response = await _notificationRepo.viewAnalysis(id);
    response.when(success: (data) {
      emit(NotificationState.successViewAnalysis(data));
    }, failure: (error) {
      emit(NotificationState.erorrViewAnalysis(erorr: error.messege ?? ''));
    });
  }

//   List<NotificationModel> allNotifications = [
//     NotificationModel(
//         title: 'mpohamed',
//         body: 'hi mohamed',
//         datetime: '2000-3-22',
//         image: 'assets/icons/delivery1.svg')
//   ];
//   List<NotificationModel> filteredNotifications = [];

//   int? totalSend;
//   int? totalOpened;
//   int? totalFailed;
//   int? totalError;
//   hhh() {
//     totalSend = notificationResult?.successDelivery ?? 0;
//     totalOpened = notificationResult?.openedNotification ?? 0;
//     totalFailed = notificationResult?.failedDelivery ?? 0;
//     totalError = notificationResult?.erroredDelivery ?? 0;
//   }

//   double calculatePercentage(int notificationCount) {
//     if (totalSend == 0) {
//       return 0;
//     } else {
//       return (notificationCount / totalSend!) * 100;
//     }
//   }
}
