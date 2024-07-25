import 'package:untitled/models/response_coupon/response_coupon.dart';

import '../../../../core/function/formDataPost.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class CouponRepo {
  final ApiService _apiService;

  CouponRepo(this._apiService);

  //ViewCoupon

  Future<ApiResult<ResponseCoupon>> ViewCoupon() async {
    try {
      final response = await _apiService.getCoupon();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  //AddCoupon

  Future<ApiResult<dynamic>> AddCoupon(String coupon, String startdata,
      String endData, int count, String discount, String maxuser) async {
    Map<String, dynamic> data = {
      "coupon": coupon,
      "startdata": startdata,
      "endData": endData,
      "count": count,
      "discount": discount,
      "maxuser": maxuser,
    };
    try {
      final response = await _apiService.addCoupon(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
