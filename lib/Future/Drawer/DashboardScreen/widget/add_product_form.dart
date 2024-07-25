import '../logic/cubit_d/dashboard_cubit.dart';
import '../../../../core/function/validator.dart';
import '../../../../models/Item.dart';
import '../../../../widgets/RowBottomAdd.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../models/category.dart';
import '../../../../utility/constants.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/multi_select_drop_down.dart';
import '../../../../widgets/product_image_card.dart';

class ProductSubmitForm extends StatelessWidget {
  final ItemsModel? product;

  const ProductSubmitForm({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: BlocConsumer<DashboardsCubit, DashboardState>(
            listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      return Form(
        key: context.read<DashboardsCubit>().addProductFormKey,
        child: Container(
          width: size.width * 0.7,
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: defaultPadding),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProductImageCard(
                      labelText: 'Main Image',
                      imageFile:
                          context.read<DashboardsCubit>().selectedMainImage,
                      imageUrlForUpdateImage: product?.itemsImage ?? null,
                      onTap: () {
                        context
                            .read<DashboardsCubit>()
                            .pickImage(imageCardNumber: 1);
                      },
                      onRemoveImage: () {
                        context.read<DashboardsCubit>().selectedMainImage =
                            null;
                      },
                    ),
                    ProductImageCard(
                      labelText: 'Second image',
                      imageFile:
                          context.read<DashboardsCubit>().selectedSecondImage,
                      imageUrlForUpdateImage: product?.itemsImage ?? null,
                      onTap: () {
                        context
                            .read<DashboardsCubit>()
                            .pickImage(imageCardNumber: 2);
                      },
                      onRemoveImage: () {
                        context.read<DashboardsCubit>().selectedSecondImage =
                            null;
                      },
                    ),
                    ProductImageCard(
                      labelText: 'Third image',
                      imageFile:
                          context.read<DashboardsCubit>().selectedThirdImage,
                      imageUrlForUpdateImage: product?.itemsImage ?? null,
                      onTap: () {
                        context
                            .read<DashboardsCubit>()
                            .pickImage(imageCardNumber: 3);
                      },
                      onRemoveImage: () {
                        context.read<DashboardsCubit>().selectedThirdImage =
                            null;
                      },
                    ),
                  ]),
              SizedBox(height: defaultPadding),
              CustomTextField(
                controller: context.read<DashboardsCubit>().productNameCtrl,
                labelText: 'Product Name',
                onSave: (val) {},
                validator: (value) {
                  validator(value, 'Please enter name');
                  return null;
                },
              ),
              SizedBox(height: defaultPadding),
              CustomTextField(
                controller: context.read<DashboardsCubit>().productDescCtrl,
                labelText: 'Product Description',
                lineNumber: 3,
                onSave: (val) {},
                validator: (value) {
                  validator(value, 'Please enter Product Description');
                  return null;
                },
              ),
              SizedBox(height: defaultPadding),
              Row(
                children: [
                  Expanded(
                    child: CustomDropdown(
                      key: ValueKey(context
                          .read<DashboardsCubit>()
                          .selectedCategory
                          ?.sId),
                      initialValue:
                          context.read<DashboardsCubit>().selectedCategory,
                      hintText: context
                              .read<DashboardsCubit>()
                              .selectedCategory
                              ?.name ??
                          'Select category',
                      items: context.read<DashboardsCubit>().category,
                      displayItem: (CategoryModel? category) =>
                          category?.name ?? '',
                      onChanged: (newValue) {
                        if (newValue != null) {
                          //TODO: should complete call  filterSubcategory
                        }
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final filteredSelectedItems = context
                            .read<DashboardsCubit>()
                            .selectedVariants
                            .where((item) => context
                                .read<DashboardsCubit>()
                                .variantsByVariantType
                                .contains(item))
                            .toList();
                        return MultiSelectDropDown(
                          items: context
                              .read<DashboardsCubit>()
                              .variantsByVariantType,
                          onSelectionChanged: (newValue) {
                            context.read<DashboardsCubit>().selectedVariants =
                                newValue;
                            print(context
                                .read<DashboardsCubit>()
                                .selectedVariants);
                          },
                          displayItem: (String item) => item,
                          selectedItems: filteredSelectedItems,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: defaultPadding),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller:
                          context.read<DashboardsCubit>().productPriceCtrl,
                      labelText: 'Price',
                      inputType: TextInputType.number,
                      onSave: (val) {},
                      validator: (value) {
                        validator(value, 'Please enter price');
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      controller:
                          context.read<DashboardsCubit>().productOffPriceCtrl,
                      labelText: 'Offer price',
                      inputType: TextInputType.number,
                      onSave: (val) {},
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      controller:
                          context.read<DashboardsCubit>().productQntCtrl,
                      labelText: 'Quantity',
                      inputType: TextInputType.number,
                      onSave: (val) {},
                      validator: (value) {
                        validator(value, 'Please enter quantity');
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(width: defaultPadding),
              SizedBox(height: defaultPadding),
              RowBotttomAdd(onPressed: () {}),
            ],
          ),
        ),
      );
    }));
  }
}

// How to show the popup
void showAddProductForm(BuildContext context, ItemsModel? product) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: bgColor,
        title: Center(
            child: Text('Add Product'.toUpperCase(),
                style: TextStyle(color: primaryColor))),
        content: ProductSubmitForm(product: product),
      );
    },
  );
}

extension SafeList<T> on List<T>? {
  T? safeElementAt(int index) {
    // Check if the list is null or if the index is out of range
    if (this == null || index < 0 || index >= this!.length) {
      return null;
    }
    return this![index];
  }
}
