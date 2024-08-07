// import '../../../../core/function/formDataPost.dart';
// import '../../../../core/networking/api_error_handler.dart';
// import '../../../../core/networking/api_result.dart';
// import '../../../../core/networking/api_service.dart';
// import '../../../../models/response_notifacation/response_notifacation.dart';

// class NotificationRepo {
//   final ApiService _apiService;

//   NotificationRepo(this._apiService);

//   //ViewNotification

//   Future<ApiResult<ResponseNotifacation >> ViewNotification() async {
//     try {
//       final response = await _apiService.getnotification();
//       return ApiResult.success(response);
//     } catch (e) {
//       return ApiResult.failure(ApiErrorHandler.handle(e));
//     }
//   }

//   //AddNotification

//   Future<ApiResult<dynamic>> AddNotification(String coupon, String startdata,
//       String endData, int count, String discount, String maxuser) async {
//     Map<String, dynamic> data = {
//       "userid": ,
//       "startdata": startdata,
//       "endData": endData,
//       "count": count,
//       "discount": discount,
//       "maxuser": maxuser,
//     };
//     try {
//       final response = await _apiService.addnotification(formDataPost(data));
//       return ApiResult.success(response);
//     } catch (e) {
//       return ApiResult.failure(ApiErrorHandler.handle(e));
//     }
//   }
// }
