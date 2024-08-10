import 'dart:io';

import 'package:untitled/models/response_items/response_items.dart';

import '../../../../core/function/function_api/formDataPost.dart';
import '../../../../core/function/function_api/ssend_list_api.dart';
import '../../../../core/function/function_api/upload_image.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class ItemsRepo {
  final ApiService _apiService;

  ItemsRepo(this._apiService);

  Future<ApiResult<dynamic>> addimages(List<File>? images, List<String> old,
      List<String> color, List<String> size) async {
    Map<String, dynamic> data = {
      // "images[]":
      //     images!.isNotEmpty ? await uploadMultiImageSToAPI(images) : '',
      "old": sendListApi(old.toString()),
      "color": sendListApi(color.toString()),
      "size": sendListApi(size.toString()),
      "quantity": 40,
    };
    try {
      final response = await _apiService.addimages(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  //ViewItems

  Future<ApiResult<ResponseItems>> viewItems() async {
    try {
      final response = await _apiService.getItems();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  //AddItems

  Future<ApiResult<dynamic>> addItems(
    String name,
    String namear,
    File file,
    String decs,
    String decsar,
    String count,
    String active,
    String price,
    String discount,
    String itemcategories,
    List size,
    List color,
    List<File> images,
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
      "size": sendListApi(size.toString()) ?? [],
      "color": sendListApi(color.toString()) ?? [],
      "images[]": await uploadMultiImageSToAPI(images),
      "file": await uploadImageToAPI(file)
    };
    try {
      final response = await _apiService.addItems(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  // Future<FormData> newMethod(List<File>? images) async {
  //   FormData formDat = FormData();

  //   for (var i = 0; i < images!.length; i++) {
  //     String filename = images[i].path.split('/').last;

  //     formDat.files.add(MapEntry('images[]',
  //         await MultipartFile.fromFile(images[i].path, filename: filename)));
  //   }
  // }
  //editItems

  Future<ApiResult<dynamic>> editItems(
      int id,
      String name,
      String namear,
      String decs,
      String decsar,
      String count,
      String active,
      String price,
      String discount,
      String itemcategories,
      List size,
      List color,
      File? file,
      List? imageold,
      List<File> images,
      String mainoldimage) async {
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
      "imageold1": mainoldimage,
      "size": sendListApi(size.toString()) ?? [],
      "color": sendListApi(color.toString()) ?? [],
      "imageold": sendListApi(imageold.toString()) ?? [],
      "images[]": images.isNotEmpty ? await uploadMultiImageSToAPI(images) : '',
      "file": file != null ? await uploadImageToAPI(file) : ''
    };

    try {
      final response = await _apiService.editItems(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  //deleteItems

  Future<ApiResult<dynamic>> deleteItems(int id, String file) async {
    Map<String, dynamic> data = {"id": id, "file": file};

    try {
      final response = await _apiService.deleteItems(formDataPost(data));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
