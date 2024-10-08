import 'dart:io';

import 'package:untitled/models/response_categories/response_categories.dart';

import '../../../../core/function/function_api/formDataPost.dart';
import '../../../../core/function/function_api/upload_image.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class CategoriesRepo {
  final ApiService _apiService;

  CategoriesRepo(this._apiService);

  //ViewCategories

  Future<ApiResult<ResponseCategories>> viewCategories() async {
    try {
      final response = await _apiService.viewCategories();

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  //AddCategories

  Future<ApiResult<dynamic>> addCategories(
      String name, String namear, File file) async {
    Map<String, dynamic> data = {
      "name": name,
      "namear": namear,
      "file": await uploadImageToAPI(file)
    };
    try {
      final response = await _apiService.addCategories(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
  //editCategories

  Future<ApiResult<dynamic>> editCategories(
      int id, String name, String namear, File? file, String imageold) async {
    Map<String, dynamic> data = {
      'id': id,
      "name": name,
      "namear": namear,
      "imageold": imageold,
      "file": file != null ? await uploadImageToAPI(file) : ''
    };
    try {
      final response = await _apiService.editCategories(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  //deleteCategories

  Future<ApiResult<dynamic>> deleteCategories(int id, String file) async {
    Map<String, dynamic> data = {"id": id, "file": file};

    try {
      final response = await _apiService.deleteCategories(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
