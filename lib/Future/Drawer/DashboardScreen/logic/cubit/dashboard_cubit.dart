import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Future/Drawer/DashboardScreen/data/repo_get_dashboard.dart';
import 'package:untitled/core/function/function_api/ssend_list_api.dart';

import '../../../../../core/function/show_dilaog/AlertDialog.dart';
import '../../../../../core/function/function_api/upload_image.dart';
import '../../../../../models/Item.dart';
import '../../../../../models/response_dashboard/datum.dart';
import '../../../../../models/select_categories/select_categories.dart';
import '../../data/repo.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._itemrepo, this._dashboardRepo)
      : super(const DashboardState.initial());

  final ItemsRepo _itemrepo;
  final DashboardRepo _dashboardRepo;

////////////////Add/////////////////////////
  TextEditingController name = TextEditingController();
  TextEditingController namear = TextEditingController();
  TextEditingController decs = TextEditingController();
  TextEditingController decsar = TextEditingController();
  TextEditingController count = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController itemCategories = TextEditingController();
  String active = '1';
  List<SelectCategories> itemCat = [];
  List<String>? selectedcolors = [];

  List<String> colors = [
    'red',
    'orange',
    'blue',
    'black',
  ];

  List<String>? selectedSize = [];

  List<String> sizes = [
    'MM',
    'ML',
    'XXL',
    'RM',
  ];
  List<String> oldimages = ['l', 'm'];

  String? selestnamecategories;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  File? selectedMainImage;
  File? selectedSecondImage;
  File? selectedThirdImage;
  List<File> images = [];
  String? oldemainimage;

  // List<ItemsData> items = [];

  /////////////////////////////////:AddItems///////////////////////////
  addItems(BuildContext context) async {
    if (selectedMainImage == null &&
        selectedSecondImage == null &&
        selectedThirdImage == null) {
      return showMyDialog(context, "erorr", "please choose image");
    }
    if (formkey.currentState!.validate()) {
      emit(const DashboardState.loadingAdd());
      final response = await _itemrepo.addItems(
          name.text,
          namear.text,
          selectedMainImage!,
          decs.text,
          decsar.text,
          count.text,
          active,
          price.text,
          discount.text,
          itemCategories.text,
          selectedSize!,
          selectedcolors!,
          images);
      response.when(success: (data) {
        emit(const DashboardState.successAdd());
      }, failure: (error) {
        emit(DashboardState.erorrAdd(erorr: error.messege!));
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }

  ///:editItems
  editItems(int id) async {
    emit(const DashboardState.loadingedit());
    final response = await _itemrepo.editItems(
        id,
        name.text,
        namear.text,
        decs.text,
        decsar.text,
        count.text,
        active,
        price.text,
        discount.text,
        itemCategories.text,
        selectedSize!,
        selectedcolors!,
        selectedMainImage,
        oldimages,
        images,
        oldemainimage ?? '');
    response.when(success: (data) {
      emit(const DashboardState.successedit());
    }, failure: (error) {
      emit(DashboardState.erorredit(erorr: error.messege ?? ''));
    });
  }

  ///:deleteItems
  deleteItems(int id, String file) async {
    emit(const DashboardState.loadingdelete());
    final response = await _itemrepo.deleteItems(id, file);
    response.when(success: (data) {
      // items.removeWhere((element) => element.itemId == id);
      emit(const DashboardState.successdelete());
    }, failure: (error) {
      emit(DashboardState.erorrdelete(erorr: error.messege ?? ''));
    });
  }

  //:viewdashboard
  viewashboard() async {
    itemCat.clear();
    emit(const DashboardState.loadingDashboard());
    final response = await _dashboardRepo.viewdashboard();
    response.when(success: (data) {
      for (var i = 0; i < data.categories!.length; i++) {
        itemCat.add(SelectCategories(
          id: data.categories![i].categoriesId ?? 0,
          name: data.categories![i].categoriesName ?? '',
        ));
      }
      emit(DashboardState.successDashboard(data));
    }, failure: (error) {
      emit(DashboardState.erorrDashboard(erorr: error.messege!));
    });
  }

  pushEdit(
    ItemsData items,
  ) async {
    selectedcolors?.clear();
    selectedSize?.clear();

    var i1 = replacMapsColorIsEnpty(items.size!);
    var i2 = replacMapsSizeIsEnpty(items.size!);
    List<String> i3 = replacListIsEnpty(items.images!);
    selectedMainImage = null;
    selectedSecondImage = null;
    selectedThirdImage = null;
    name.text = items.itemName ?? '';
    namear.text = items.itemNameAr ?? "";
    decs.text = items.itemDecs ?? '';
    decsar.text = items.itemDecsAr ?? "";
    count.text = items.itemCount.toString();
    active = items.itemActive.toString();
    price.text = items.itemPrice.toString();
    discount.text = items.itemDiscount.toString();
    itemCategories.text = items.itemCategories.toString();
    selestnamecategories = items.categoriesName;
    oldimages = i3;
    oldemainimage = items.itemImage;
    // oldetwoimage = items.itemImage?[0];
    // oldethreeimage = items.itemImage?[1];

    for (var i = 0; i < i1.length; i++) {
      selectedcolors!.add(i1[i].color!);
    }
    for (var i = 0; i < i2.length; i++) {
      selectedSize!.add(i2[i].size!);
    }
    emit(const DashboardState.pushEdit());
  }

  ItemsModel? productForUpdate;

  // XFile? mainImgXFile, secondImgXFile, thirdImgXFile;

  // VariantType? variantTypeForUpdate;

  int totalOrder = 10;
  int pendingOrder = 4;
  int processingOrder = 3;
  int cancelledOrder = 2;
  int shippedOrder = 6;
  int deliveredOrder = 1;
  ////////////////
  int totalProduct = 4;
  // totalProduct = 1;
  int outOfStockProduct = 33;
  int limitedStockProduct = 0;
  int otherStockProduct = 1;
  // totalOrder = pendingOrder + deliveredOrder + processingOrder + shippedOrder;

  ///////////////////////////////function
  void pickImage({
    required int imageCardNumber,
  }) async {
    final File? image = await imageuploadgallery();
    if (image != null) {
      if (imageCardNumber == 1) {
        selectedMainImage = image;

        emit(const DashboardState.galer());
      } else if (imageCardNumber == 2) {
        // selectedSecondImage = File(image.path);
        selectedSecondImage = image;
        images.add(selectedSecondImage!);
        emit(const DashboardState.galer2());
      } else if (imageCardNumber == 3) {
        // selectedThirdImage = File(image.path);
        selectedThirdImage = image;
        images.add(selectedThirdImage!);
        emit(const DashboardState.galer3());
      }
      // emit(const DashboardState.galer());
    }
  }

  hhhhhhh(int imageCardNumber) async {
    if (imageCardNumber == 1) {
      selectedMainImage = null;

      emit(const DashboardState.remofgaler());
    } else if (imageCardNumber == 2) {
      // selectedSecondImage = File(image.path);
      images.remove(selectedSecondImage!);
      selectedSecondImage = null;

      emit(const DashboardState.removegaler2());
    } else if (imageCardNumber == 3) {
      // selectedThirdImage = File(image.path);
      images.remove(selectedThirdImage!);
      selectedThirdImage = null;

      emit(const DashboardState.removegaler3());
    }
  }

  removeControlerpushAdd() {
    name.clear();
    namear.clear();
    decs.clear();
    decsar.clear();
    count.clear();
    price.clear();
    discount.clear();
    itemCategories.clear();
    selestnamecategories = null;
    selectedcolors?.clear();
    selectedSize?.clear();
    selectedMainImage = null;
    oldemainimage = null;
    images.clear();
    oldimages = ['l', 'm'];

    emit(const DashboardState.removeControll());
  }
}
