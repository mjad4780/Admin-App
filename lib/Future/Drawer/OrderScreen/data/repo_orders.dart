import '../../../../core/function/formDataPost.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../models/response_details/response_details.dart';

class OrdersRepo {
  final ApiService _apiService;

  OrdersRepo(this._apiService);

  //approve

  Future<ApiResult<dynamic>> approve(int orderid, int userid) async {
    Map<String, dynamic> data = {
      "orderid": orderid,
      "userid": userid,
    };

    try {
      final response = await _apiService.approve(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
  //prepare

  Future<ApiResult<dynamic>> prepare(int type, int orderid, int userid) async {
    Map<String, dynamic> data = {
      "orderid": orderid,
      "userid": userid,
      "type": type,
    };
    try {
      final response = await _apiService.prepare(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  } //done

  Future<ApiResult<dynamic>> done(int orderid, int userid) async {
    Map<String, dynamic> data = {
      "orderid": orderid,
      "userid": userid,
    };
    try {
      final response = await _apiService.done(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
  //shipped

  Future<ApiResult<dynamic>> shipped(int orderid, int userid) async {
    Map<String, dynamic> data = {
      "orderid": orderid,
      "userid": userid,
    };
    try {
      final response = await _apiService.shipped(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  //viewdetails

  Future<ApiResult<ResponseDetails>> viewdetails(
      int orderid, int userid) async {
    Map<String, dynamic> data = {
      "orderid": orderid,
      "userid": userid,
    };
    try {
      final response = await _apiService.viewdetails(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}