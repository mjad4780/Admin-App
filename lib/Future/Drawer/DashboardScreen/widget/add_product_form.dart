import '../../../../core/networking/api_constants.dart';
import '../../../../widgets/product_image_card.dart';
import '../logic/cubit/dashboard_cubit.dart';
import '../../../../core/function/validator.dart';
import '../../../../widgets/RowBottomAdd.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/constants.dart';
import '../../../../widgets/custom_text_field.dart';
import 'Add_items/RowSelectedCategoriesAndColorAndSize.dart';
import 'Add_items/add_items_bloc.dart';
import 'Add_items/aprrove_items.dart';
import 'edit_items/edit_itemsbloc.dart';

class ProductSubmitForm2 extends StatelessWidget {
  const ProductSubmitForm2({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Form(
      key: context.read<DashboardCubit>().formkey,
      child: Container(
        width: size.width,
        // padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: defaultPadding),
              ProductImageCard(
                size: 150,
                labelText: 'Main Image',
                imageFile: context.read<DashboardCubit>().selectedMainImage,
                imageUrlForUpdateImage:
                    '${ApiConstants.imageItem}/${context.read<DashboardCubit>().oldemainimage}',
                //  '${ApiConstants.imageItem}/${context.read<DashboardCubit>().image}',
                ifcondition: 'http://localhost/e-ecommerse/upload/item/null',
                onTap: () {
                  context.read<DashboardCubit>().pickImage(imageCardNumber: 1);
                },
                onRemoveImage: () {
                  context.read<DashboardCubit>().hhhhhhh(1);
                },
              ),
              const SizedBox(height: defaultPadding),
              CustomTextField(
                controller: context.read<DashboardCubit>().name,
                labelText: 'Product Name',
                onSave: (val) {},
                validator: (value) {
                  return validator(value, 'Please enter name');
                },
              ),
              CustomTextField(
                controller: context.read<DashboardCubit>().namear,
                labelText: 'Product NameAr',
                onSave: (val) {},
                validator: (value) {
                  return validator(value, 'Please enter nameAr');
                },
              ),
              const SizedBox(height: defaultPadding),
              CustomTextField(
                controller: context.read<DashboardCubit>().decs,
                labelText: 'Product Description',
                lineNumber: 1,
                onSave: (val) {},
                validator: (value) {
                  return validator(value, 'Please enter Product Description');
                },
              ),
              CustomTextField(
                controller: context.read<DashboardCubit>().decsar,
                labelText: 'Product DescriptionAr',
                lineNumber: 1,
                onSave: (val) {},
                validator: (value) {
                  return validator(value, 'Please enter Product DescriptionAr');
                },
              ),
              const SizedBox(height: defaultPadding),
              const RowSelectedCategoriesAndColorAndSize(),
              const SizedBox(height: defaultPadding),
              CustomTextField(
                controller: context.read<DashboardCubit>().price,
                labelText: 'Price',
                inputType: TextInputType.number,
                onSave: (val) {},
                validator: (value) {
                  return validator(value, 'Please enter price');
                },
              ),
              CustomTextField(
                controller: context.read<DashboardCubit>().discount,
                labelText: 'Offer price',
                inputType: TextInputType.number,
                onSave: (val) {},
                validator: (value) {
                  return validator(value, 'Please enter Offer price');
                },
              ),
              CustomTextField(
                controller: context.read<DashboardCubit>().count,
                labelText: 'Quantity',
                inputType: TextInputType.number,
                onSave: (val) {},
                validator: (value) {
                  return validator(value, 'Please enter quantity');
                },
              ),
              const ApproveItems(),
              const SizedBox(width: defaultPadding),
              RowBotttomAdd(
                onPressed: onPressed,
              ),
              const AddItemsBlocListener(),
              const EditItemsBlocListener()
            ],
          ),
        ),
      ),
    );
  }
}

// extension SafeList<T> on List<T>? {
//   T? safeElementAt(int index) {
//     // Check if the list is null or if the index is out of range
//     if (this == null || index < 0 || index >= this!.length) {
//       return null;
//     }
//     return this![index];
//   }
// }


