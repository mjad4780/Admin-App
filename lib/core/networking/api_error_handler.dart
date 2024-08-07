import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorModel(messege: "Connection to server failed");
        case DioExceptionType.cancel:
          return ApiErrorModel(messege: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(messege: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ApiErrorModel(
              messege:
                  "Connection to the server failed due to internet connection");
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
              messege: "Receive timeout in connection with the server");
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
              messege: "Send timeout in connection with the server");
        default:
          return ApiErrorModel(messege: "Something went wrong");
      }
    } else {
      return ApiErrorModel(messege: "Unknown error occurred");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
    messege: data['messege'] ?? "Unknown error ",
    status: data['status'],
  );
}
