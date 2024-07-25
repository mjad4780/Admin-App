import 'dart:io';

import 'package:untitled/models/response_items/response_items.dart';

import '../../../../core/function/formDataPost.dart';
import '../../../../core/function/upload_image.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class ItemsRepo {
  final ApiService _apiService;

  ItemsRepo(this._apiService);

  //ViewItems

  Future<ApiResult<List<ResponseItems>>> ViewItems() async {
    try {
      final response = await _apiService.getItems();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  //AddItems

  Future<ApiResult<dynamic>> AddItems(
    String name,
    String namear,
    File file,
    String decs,
    String decsar,
    int count,
    int active,
    int price,
    int discount,
    int itemcategories,
    List size,
    List color,
    int quantity,
    List images,
  ) async {
    Map<String, dynamic> data = {
      "name": name,
      "namear": namear,
      "decs": decs,
      "decsar": decsar,
      "count": count,
      "active": active,
      "price": price,
      "discount": discount,
      "itemcategories": itemcategories,
      "size": size,
      "color": color,
      "quantity": quantity,
      "images[]": images,
      "file": await uploadImageToAPI(file)
    };
    try {
      final response = await _apiService.addItems(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
  //editItems

  Future<ApiResult<dynamic>> editItems(
    int id,
    String name,
    String namear,
    String decs,
    String decsar,
    int count,
    int active,
    int price,
    int discount,
    int itemcategories,
    List size,
    List color,
    int quantity,
    File? file,
    List? imageold,
    List images,
  ) async {
    Map<String, dynamic> data = {
      "id": id,
      "name": name,
      "namear": namear,
      "decs": decs,
      "decsar": decsar,
      "count": count,
      "active": active,
      "price": price,
      "discount": discount,
      "itemcategories": itemcategories,
      "size": size,
      "color": color,
      "quantity": quantity,
      "imageold": imageold ?? 'old',
      "images[]": images,
      "file": file != null ? await uploadImageToAPI(file) : ''
    };

    try {
      final response = await _apiService.editItems(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  //deleteItems

  Future<ApiResult<dynamic>> deleteItems(int id, String file) async {
    Map<String, dynamic> data = {"id": id, "file": file};

    try {
      final response = await _apiService.deleteItems(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
