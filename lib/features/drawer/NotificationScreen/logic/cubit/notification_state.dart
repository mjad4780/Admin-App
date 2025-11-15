import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:untitled/models/notification_analysis/notification_analysis_model.dart';

import '../../../../../models/response_notification/response_notification.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;

  ///:add
  const factory NotificationState.loadingAdd() = LoadingAdd;
  const factory NotificationState.successAdd() = SuccessAdd;
  const factory NotificationState.erorrAdd({required String erorr}) = ErorrAdd;

  ///:View
  const factory NotificationState.loadingView() = LoadingView;
  const factory NotificationState.successView(ResponseNotification response) =
      SuccessView;
  const factory NotificationState.erorrView({required String erorr}) =
      ErorrView;

  ///:ViewAnalysis
  const factory NotificationState.loadingViewAnalysis() = LoadingViewAnalysis;
  const factory NotificationState.successViewAnalysis(
      NotificationAnalysisModel response) = SuccessViewAnalysis;
  const factory NotificationState.erorrViewAnalysis({required String erorr}) =
      ErorrViewAnalysis;
}
