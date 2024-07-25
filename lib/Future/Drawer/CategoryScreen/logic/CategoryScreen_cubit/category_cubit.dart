import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/function/upload_image.dart';
import '../../../../../models/category.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final addCategoryFormKey = GlobalKey<FormState>();
  TextEditingController categoryNameCtrl = TextEditingController();
  TextEditingController categoryNameCtrlAr = TextEditingController();

  CategoryModel? categoryForUpdate;

  File? selectedImage;
  XFile? imgXFile;
  List<CategoryModel> categories = [];

  pickImage() async {
    selectedImage = await imageuploadgallery();
  }

  //   void pickImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     selectedImage = File(image.path);
  //     imgXFile = image;
  //   }
  // }

  //TODO: should complete deleteCategory

  //TODO: should complete setDataForUpdateCategory

  //? to create form data for sending image with body
  // Future<FormData> createFormData({required XFile? imgXFile, required Map<String, dynamic> formData}) async {
  //   if (imgXFile != null) {
  //     MultipartFile multipartFile;
  //     if (kIsWeb) {
  //       String fileName = imgXFile.name;
  //       Uint8List byteImg = await imgXFile.readAsBytes();
  //       multipartFile = MultipartFile(byteImg, filename: fileName);
  //     } else {
  //       String fileName = imgXFile.path.split('/').last;
  //       multipartFile = MultipartFile(imgXFile.path, filename: fileName);
  //     }
  //     formData['img'] = multipartFile;
  //   }
  //   final FormData form = FormData(formData);
  //   return form;
  // }

  //? set data for update on editing
  setDataForUpdateCategory(CategoryModel? category) {
    if (category != null) {
      clearFields();
      categoryForUpdate = category;
      categoryNameCtrl.text = category.name ?? '';
      categoryNameCtrlAr.text = category.namear ?? '';
      emit(SetDataForUpdateCategory());
    } else {
      clearFields();
    }
  }

  //? to clear text field and images after adding or update category
  clearFields() {
    categoryNameCtrl.clear();
    selectedImage = null;
    imgXFile = null;
    categoryForUpdate = null;
    emit(ClearFields());
  }
}
