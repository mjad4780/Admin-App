import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../models/response_orders/response_orders.dart';

class ViewOrdersRepo {
  final ApiService _apiService;

  ViewOrdersRepo(this._apiService);

  //viewapprove

  Future<ApiResult<ResponseOrders>> viewapprove() async {
    try {
      final response = await _apiService.viewapprove();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
  //viewCancel

  Future<ApiResult<ResponseOrders>> viewCancel() async {
    try {
      final response = await _apiService.viewCancel();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  } //viewdone

  Future<ApiResult<ResponseOrders>> viewdone() async {
    try {
      final response = await _apiService.viewdone();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
  //viewpending

  Future<ApiResult<ResponseOrders>> viewpending() async {
    try {
      final response = await _apiService.viewpending();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
  //viewprepare

  Future<ApiResult<ResponseOrders>> viewprepare() async {
    try {
      final response = await _apiService.viewprepare();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
  //viewshipped

  Future<ApiResult<ResponseOrders>> viewshipped() async {
    try {
      final response = await _apiService.viewshipped();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
