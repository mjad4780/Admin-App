import 'dart:io';

import '../../../../../models/category.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/function/upload_image.dart';
import '../../../../../models/Item.dart';

part 'dashboard_state.dart';

class DashboardsCubit extends Cubit<DashboardState> {
  DashboardsCubit() : super(DashboardInitial());
  final addProductFormKey = GlobalKey<FormState>();

  //?text editing controllers in dashBoard screen
  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescCtrl = TextEditingController();
  TextEditingController productQntCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();
  TextEditingController productOffPriceCtrl = TextEditingController();

  CategoryModel? selectedCategory;
  List<CategoryModel> category = [
    CategoryModel(sId: '1', name: 'laptop'),
    CategoryModel(sId: '2', name: 'mobile'),
    CategoryModel(sId: '3', name: 'PC')
  ];

  ItemsModel? productForUpdate;

  File? selectedMainImage, selectedSecondImage, selectedThirdImage;

  // XFile? mainImgXFile, secondImgXFile, thirdImgXFile;
  List<ItemsModel> products = [
    ItemsModel(
        categoriesName: 'Laptob',
        // itemsImage: Assets.iconsDelivery1,
        itemsName: 'dell',
        itemsPrice: 200,
        itemsCount: 3)
  ];
  List<String> selectedVariants = ['Colors'];

  List<String> variantsByVariantType = [
    'red',
    'orange',
    'blue',
    'black',
  ];
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
  void pickImage({required int imageCardNumber}) async {
    final File? image = await imageuploadgallery();
    if (image != null) {
      if (imageCardNumber == 1) {
        // selectedMainImage = File(image.path);
        selectedMainImage = image;
      } else if (imageCardNumber == 2) {
        // selectedSecondImage = File(image.path);
        selectedSecondImage = image;
      } else if (imageCardNumber == 3) {
        // selectedThirdImage = File(image.path);
        selectedThirdImage = image;
      }
    }
  }
//   }

  // Future<FormData> createFormDataForMultipleImage({
  //   required List<Map<String, XFile?>>? imgXFiles,
  //   required Map<String, dynamic> formData,
  // }) async {
  //   // Loop over the provided image files and add them to the form data
  //   if (imgXFiles != null) {
  //     for (int i = 0; i < imgXFiles.length; i++) {
  //       XFile? imgXFile = imgXFiles[i]['image' + (i + 1).toString()];
  //       if (imgXFile != null) {
  //         // Check if it's running on the web
  //         if (kIsWeb) {
  //           String fileName = imgXFile.name;
  //           Uint8List byteImg = await imgXFile.readAsBytes();
  //           formData['image' + (i + 1).toString()] = MultipartFile(byteImg, filename: fileName);
  //         } else {
  //           String filePath = imgXFile.path;
  //           String fileName = filePath.split('/').last;
  //           formData['image' + (i + 1).toString()] = await MultipartFile(filePath, filename: fileName);
  //         }
  //       }
  //     }
  //   }

  // setDataForUpdateProduct(Product? product) {
  //   if (product != null) {
  //     productForUpdate = product;

  //     productNameCtrl.text = product.name ?? '';
  //     productDescCtrl.text = product.description ?? '';
  //     productPriceCtrl.text = product.price.toString();
  //     productOffPriceCtrl.text = '${product.offerPrice}';
  //     productQntCtrl.text = '${product.quantity}';

  //     selectedCategory = _dataProvider.categories.firstWhereOrNull((element) => element.sId == product.proCategoryId?.sId);

  //     final newListCategory = _dataProvider.subCategories
  //         .where((subcategory) => subcategory.categoryId?.sId == product.proCategoryId?.sId)
  //         .toList();
  //     subCategoriesByCategory = newListCategory;
  //     selectedSubCategory =
  //     _dataProvider.subCategories.firstWhereOrNull((element) => element.sId == product.proSubCategoryId?.sId);

  // final newListBrand =
  //     _dataProvider.brands.where((brand) => brand.subcategoryId?.sId == product.proSubCategoryId?.sId).toList();
  // brandsBySubCategory = newListBrand;
  // selectedBrand = _dataProvider.brands.firstWhereOrNull((element) => element.sId == product.proBrandId?.sId);

  // selectedVariantType =
  //     _dataProvider.variantTypes.firstWhereOrNull((element) => element.sId == product.proVariantTypeId?.sId);

  //      newListVariant = _dataProvider.variants
  //         .where((variant) => variant.variantTypeId?.sId == product.proVariantTypeId?.sId)
  //         .toList();
  //     final List<String> variantNames = newListVariant.map((variant) => variant.name ?? '').toList();
  //     variantsByVariantType = variantNames;
  //     selectedVariants = product.proVariantId ?? [];
  //   } else {
  //     clearFields();
  //   }
  // }
}
