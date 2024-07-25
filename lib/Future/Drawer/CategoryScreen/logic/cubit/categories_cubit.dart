import 'dart:io';

import 'package:untitled/Future/Drawer/CategoryScreen/data/repo.dart';
import 'package:untitled/core/extensions/extention_navigator.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/function/AlertDialog.dart';
import '../../../../../core/function/upload_image.dart';
import '../../../../../models/response_categories/datum.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._categoriesRepo)
      : super(const CategoriesState.initial());

  final CategoriesRepo _categoriesRepo;

  ///:add
  TextEditingController name = TextEditingController();
  TextEditingController namear = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
//
  ///:edit
  TextEditingController nameedit = TextEditingController();
  TextEditingController namearedit = TextEditingController();
  TextEditingController old = TextEditingController();

  GlobalKey<FormState> formstateeduit = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  File? file;
  List<Datum> categories = [];

  ///:chooseimagegaler
  chooseimagegaler() async {
    file = await imageuploadgallery();
    emit(const CategoriesState.galer());
  }

  ///:viewCategories
  viewCategories() async {
    emit(const CategoriesState.loadingview());
    final response = await _categoriesRepo.ViewCategories();
    response.when(success: (data) {
      categories = data.data ?? [];
      emit(CategoriesState.successview(data));
    }, failure: (error) {
      emit(CategoriesState.erorrview(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:AddCategories
  addCategories(BuildContext context) async {
    if (file == null) {
      return showMyDialog(context, "erorr", "please choose image");
    }

    emit(const CategoriesState.loadingAdd());
    final response =
        await _categoriesRepo.AddCategories(name.text, namear.text, file!);
    response.when(success: (data) {
      emit(const CategoriesState.successAdd());
    }, failure: (error) {
      emit(CategoriesState.erorrAdd(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:editcategories
  editCategories(String name, String namear, String old, file) async {
    emit(const CategoriesState.loadingedit());
    final response = await _categoriesRepo.editCategories(
      name,
      namear,
      file,
      old,
    );
    response.when(success: (data) {
      emit(const CategoriesState.successedit());
    }, failure: (error) {
      emit(CategoriesState.erorredit(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:deleteCategories
  deleteCategories(int id, String file) async {
    emit(const CategoriesState.loadingdelete());
    final response = await _categoriesRepo.deleteCategories(id, file);
    response.when(success: (data) {
      categories.removeWhere((element) => element.categoriesId == id);
      emit(const CategoriesState.successdelete());
    }, failure: (error) {
      emit(CategoriesState.erorrdelete(
          erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  pushEdit(Datum categoreis, BuildContext context) {
    nameedit.text = categoreis.categoriesName!;
    namearedit.text = categoreis.categoriesNameAr!;
    old.text = categoreis.categoriesImage!;
    context.push('');
    emit(const CategoriesState.PushEdit());
  }
}
