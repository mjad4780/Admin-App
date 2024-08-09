import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/function/AlertDialog.dart';
import '../../../../../core/function/function_api/upload_image.dart';
import '../../../../../models/Item.dart';
import '../../../../../models/response_items/datum.dart';
import '../../../../../models/response_items/size.dart';
import '../../../../../models/select_categories/select_categories.dart';
import '../../../CategoryScreen/data/repo.dart';
import '../../data/repo.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._itemrepo, this._categoriesRepo)
      : super(const DashboardState.initial());

  final ItemsRepo _itemrepo;
  final CategoriesRepo _categoriesRepo;

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
  List<String> selectedcolors = [];

  List<String> colors = [
    'red',
    'orange',
    'blue',
    'black',
  ];

  List<String> selectedSize = [];

  List<String> sizes = [
    'MM',
    'ML',
    'XXL',
    'RM',
  ];
  List<String> oldimage = [];

  String? selestnamecategories;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  File? selectedMainImage;
  File? selectedSecondImage;
  File? selectedThirdImage;
  List<File> images = [];

  List<ItemsData> items = [];

  ///:chooseimagegaler
  // chooseimagegaler() async {
  //   file = await imageuploadgallery();
  //   emit(const DashboardState.galer());
  // }

  //////////////////////////////:viewItems/////////////////////////
  viewItems() async {
    emit(const DashboardState.loadingview());
    final response = await _itemrepo.viewItems();
    response.when(success: (data) {
      items = data.data ?? [];
      emit(DashboardState.successview(data.data ?? []));
    }, failure: (error) {
      emit(DashboardState.erorrview(erorr: error.messege ?? ''));
    });
  }

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
          selectedSize,
          selectedcolors,
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
        selectedSize,
        selectedcolors,
        selectedMainImage,
        oldimage,
        images);
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
      items.removeWhere((element) => element.itemId == id);
      emit(const DashboardState.successdelete());
    }, failure: (error) {
      emit(DashboardState.erorrdelete(erorr: error.messege ?? ''));
    });
  }

  ///:viewCategories
  viewCategories() async {
    itemCat.clear();
    emit(const DashboardState.loadingviewCat());
    final response = await _categoriesRepo.viewCategories();
    response.when(success: (data) {
      for (var i = 0; i < data.data!.length; i++) {
        itemCat.add(SelectCategories(
          id: data.data![i].categoriesId ?? 0,
          name: data.data![i].categoriesName ?? '',
        ));
      }
      emit(const DashboardState.successviewCat());
    }, failure: (error) {
      print('jjjjjjjjjjjjjjjjjj${error.messege}');
      emit(DashboardState.erorrviewCat(erorr: error.messege!));
    });
  }

  pushEdit(ItemsData items, BuildContext context, ItemSize size) {
    name.text = items.itemName ?? 'M';
    name.text = items.itemNameAr ?? "";
    decs.text = items.itemDecs ?? 'M';
    decsar.text = items.itemDecsAr ?? "";
    count.text = items.itemCount.toString();
    active = items.itemActive.toString();
    price.text = items.itemPrice.toString();
    discount.text = items.itemDiscount.toString();
    itemCategories.text = items.itemCategories.toString();
    context.push('');
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

  // /////////test
  // ///:viewItems
  // List<String> old = ["50531b3gggggg29.jpg", "50531b32ggggggg9.jpg"];
  // List<String> colors = ['redy', 'blacky'];
  // List<String> size = [
  //   'MMk',
  //   'LLr',
  //   'EEE',
  // ];

  // addimahes() async {
  //   emit(const DashboardState.loadingvimage());
  //   final response = await _itemrepo.addimages(images, old, colors, size);
  //   response.when(success: (data) {
  //     emit(const DashboardState.successimage());
  //   }, failure: (error) {
  //     emit(DashboardState.erorrvimage(erorr: error.messege ?? ''));
  //   });
  // }
}
