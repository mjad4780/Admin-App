import '../../../../core/function/function_api/formDataPost.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../models/notification_analysis/notification_analysis_model.dart';
import '../../../../models/response_notification/response_notification.dart';

class NotificationRepo {
  final ApiService _apiService;

  NotificationRepo(this._apiService);

  //ViewNotification

  Future<ApiResult<ResponseNotification>> viewNotification() async {
    try {
      final response = await _apiService.getnotification();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  //AddNotification

  Future<ApiResult<dynamic>> addNotification(
      String title, String body, String image) async {
    Map<String, dynamic> data = {
      "title": title,
      "body": body,
      "image": image,
    };
    try {
      final response = await _apiService.addnotification(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  //ViewNotificationAnalysis

  Future<ApiResult<NotificationAnalysisModel>> viewAnalysis(
    String id,
  ) async {
    Map<String, dynamic> data = {
      "id": id,
    };
    try {
      final response = await _apiService.viewAnalysis(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
