import 'dart:io';

import '../../../../core/function/function_api/formDataPost.dart';
import '../../../../core/function/function_api/upload_image.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../models/response_poster/response_poster.dart';

class PosterRepo {
  final ApiService _apiService;

  PosterRepo(this._apiService);

  //ViewPoster

  Future<ApiResult<ResponsePoster>> ViewPoster() async {
    try {
      final response = await _apiService.getposter();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  //AddPoster

  Future<ApiResult<dynamic>> AddPoster(
      String title, String body, File file) async {
    Map<String, dynamic> data = {
      "title": title,
      "body": body,
      "file": await uploadImageToAPI(file),
    };
    try {
      final response = await _apiService.addposter(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
