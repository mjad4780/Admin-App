import 'dart:io';

import 'package:untitled/Future/Drawer/CategoryScreen/data/repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/function/show_dilaog/AlertDialog.dart';
import '../../../../../core/function/function_api/upload_image.dart';
import '../../../../../models/response_categories/datum.dart';
import '../../../../../models/select_categories/select_categories.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._categoriesRepo)
      : super(const CategoriesState.initial());

  final CategoriesRepo _categoriesRepo;

  ///:add
  TextEditingController name = TextEditingController();
  TextEditingController namear = TextEditingController();
  GlobalKey<FormState> addCategoryFormKey = GlobalKey<FormState>();
//
  ///:edit
  TextEditingController nameedit = TextEditingController();
  TextEditingController namearedit = TextEditingController();

  GlobalKey<FormState> formstateeduit = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  File? file;
  List<Datum> categories = [];
  List<SelectCategories> itemCat = [];
  String? image;
  String? old;

  ///:chooseimagegaler
  chooseimagegaler() async {
    file = await imageuploadgallery();
    if (file != null) {
      emit(const CategoriesState.galer());
    }
  }

  ///:viewCategories
  viewCategories() async {
    emit(const CategoriesState.loadingview());
    final response = await _categoriesRepo.viewCategories();
    response.when(success: (data) {
      categories = data.data ?? [];
      for (var i = 0; i < categories.length; i++) {
        itemCat.add(SelectCategories(
          id: categories[i].categoriesId ?? 0,
          name: categories[i].categoriesName ?? '',
        ));
      }
      emit(CategoriesState.successview(data));
    }, failure: (error) {
      emit(CategoriesState.erorrview(erorr: error.messege ?? ''));
    });
  }

  ///:AddCategories
  addCategories(BuildContext context) async {
    if (file == null) {
      return showMyDialog(context, "erorr", "please choose image");
    }
    if (addCategoryFormKey.currentState!.validate()) {
      emit(const CategoriesState.loadingAdd());
      final response =
          await _categoriesRepo.addCategories(name.text, namear.text, file!);
      response.when(success: (data) {
        emit(const CategoriesState.successAdd());
      }, failure: (error) {
        emit(CategoriesState.erorrAdd(erorr: error.messege ?? ''));
      });
    }
  }

  ///:editcategories
  editCategories(int id) async {
    if (addCategoryFormKey.currentState!.validate()) {
      emit(const CategoriesState.loadingedit());
      final response = await _categoriesRepo.editCategories(
        id,
        name.text,
        namear.text,
        file,
        old ?? '',
      );
      response.when(success: (data) {
        emit(const CategoriesState.successedit());
      }, failure: (error) {
        emit(CategoriesState.erorredit(erorr: error.messege ?? ''));
      });
    }
  }

  ///:deleteCategories
  deleteCategories(int id, String file) async {
    emit(const CategoriesState.loadingdelete());
    final response = await _categoriesRepo.deleteCategories(id, file);
    response.when(success: (data) {
      categories.removeWhere((element) => element.categoriesId == id);
      emit(const CategoriesState.successdelete());
    }, failure: (error) {
      emit(CategoriesState.erorrdelete(erorr: error.messege ?? ''));
    });
  }

  setDataForUpdateCategory(Datum categoreis, BuildContext context) {
    file = null;
    image = categoreis.categoriesImage;
    name.text = categoreis.categoriesName!;
    namear.text = categoreis.categoriesNameAr!;
    old = categoreis.categoriesImage!;
    emit(const CategoriesState.PushEdit());
  }
}
