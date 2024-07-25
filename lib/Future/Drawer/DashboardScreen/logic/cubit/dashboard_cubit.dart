import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/function/AlertDialog.dart';
import '../../../../../core/function/upload_image.dart';
import '../../../../../models/response_items/response_items.dart';
import '../../../../../models/response_items/size.dart';
import '../../data/repo.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._itemrepo) : super(DashboardState.initial());

  final ItemsRepo _itemrepo;

////////////////Add/////////////////////////
  TextEditingController name = TextEditingController();
  TextEditingController namear = TextEditingController();
  TextEditingController decs = TextEditingController();
  TextEditingController decsar = TextEditingController();
  TextEditingController count = TextEditingController();
  TextEditingController active = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController itemCategories = TextEditingController();

  List size = [];
  List color = [];
  List images = [];
////////////////////////edit///////////////
  TextEditingController editname = TextEditingController();
  TextEditingController editnamear = TextEditingController();
  TextEditingController editdecs = TextEditingController();
  TextEditingController editdecsar = TextEditingController();
  TextEditingController editcount = TextEditingController();
  TextEditingController editactive = TextEditingController();
  TextEditingController editprice = TextEditingController();
  TextEditingController editdiscount = TextEditingController();
  TextEditingController editquantity = TextEditingController();
  TextEditingController edititemCategories = TextEditingController();

  List editsize = [];
  List editcolor = [];
  List editimages = [];
  List editold = [];

  GlobalKey<FormState> formstateeduit = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  File? file;
  File? editfile;

  List<ResponseItems> items = [];

  ///:chooseimagegaler
  chooseimagegaler() async {
    file = await imageuploadgallery();
    emit(const DashboardState.galer());
  }

  ///:viewItems
  viewItems() async {
    emit(const DashboardState.loadingview());
    final response = await _itemrepo.ViewItems();
    response.when(success: (data) {
      items = data;
      emit(DashboardState.successview(data));
    }, failure: (error) {
      emit(DashboardState.erorrview(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:AddItems
  addItems(BuildContext context) async {
    if (file == null)
      return showMyDialog(context, "erorr", "please choose image");

    emit(const DashboardState.loadingAdd());
    final response = await _itemrepo.AddItems(
        name.text,
        namear.text,
        file!,
        decs.text,
        decsar.text,
        int.parse(count.text),
        int.parse(active.text),
        int.parse(price.text),
        int.parse(discount.text),
        int.parse(itemCategories.text),
        size,
        color,
        int.parse(quantity.text),
        images);
    response.when(success: (data) {
      emit(const DashboardState.successAdd());
    }, failure: (error) {
      emit(DashboardState.erorrAdd(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:editItems
  editItems(int id) async {
    emit(const DashboardState.loadingedit());
    final response = await _itemrepo.editItems(
        id,
        editname.text,
        editnamear.text,
        editdecs.text,
        editdecsar.text,
        int.parse(editcount.text),
        int.parse(editactive.text),
        int.parse(editprice.text),
        int.parse(editdiscount.text),
        int.parse(edititemCategories.text),
        editsize,
        editcolor,
        int.parse(editquantity.text),
        editfile,
        editold,
        editimages);
    response.when(success: (data) {
      emit(const DashboardState.successedit());
    }, failure: (error) {
      emit(DashboardState.erorredit(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:deleteItems
  deleteItems(int id, String file) async {
    emit(const DashboardState.loadingdelete());
    final response = await _itemrepo.deleteItems(id, file);
    response.when(success: (data) {
      items.removeWhere((element) => element.itemId == id);
      emit(const DashboardState.successdelete());
    }, failure: (error) {
      emit(
          DashboardState.erorrdelete(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  pushEdit(ResponseItems items, BuildContext context, ItemSize size) {
    editname.text = items.itemName ?? 'M';
    editname.text = items.itemNameAr ?? "";
    editdecs.text = items.itemDecs ?? 'M';
    editdecsar.text = items.itemDecsAr ?? "";
    editcount.text = items.itemCount.toString();
    editactive.text = items.itemActive.toString();
    editprice.text = items.itemPrice.toString();
    editdiscount.text = items.itemDiscount.toString();
    edititemCategories.text = items.itemCategories.toString();
    editquantity.text = size.quantity.toString();
    // editname.text = items.itemName ?? 'M';
    // editname.text = items.itemNameAr ?? "";
    context.push('');
    emit(const DashboardState.PushEdit());
  }
}
