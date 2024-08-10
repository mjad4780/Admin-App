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
import 'row_add_images.dart';

class ProductSubmitForm extends StatefulWidget {
  const ProductSubmitForm({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;
  @override
  State<ProductSubmitForm> createState() => _ProductSubmitFormState();
}

class _ProductSubmitFormState extends State<ProductSubmitForm> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().viewCategories();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Form(
      key: context.read<DashboardCubit>().formkey,
      child: Container(
        width: size.width * 0.7,
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListView(
          children: [
            const SizedBox(height: defaultPadding),
            const RowAddImages(),
            const SizedBox(height: defaultPadding),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: context.read<DashboardCubit>().name,
                    labelText: 'Product Name',
                    onSave: (val) {},
                    validator: (value) {
                      return validator(value, 'Please enter name');
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    controller: context.read<DashboardCubit>().namear,
                    labelText: 'Product NameAr',
                    onSave: (val) {},
                    validator: (value) {
                      return validator(value, 'Please enter nameAr');
                    },
                  ),
                ),
              ],
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
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: context.read<DashboardCubit>().price,
                    labelText: 'Price',
                    inputType: TextInputType.number,
                    onSave: (val) {},
                    validator: (value) {
                      return validator(value, 'Please enter price');
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    controller: context.read<DashboardCubit>().discount,
                    labelText: 'Offer price',
                    inputType: TextInputType.number,
                    onSave: (val) {},
                    validator: (value) {
                      return validator(value, 'Please enter Offer price');
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    controller: context.read<DashboardCubit>().count,
                    labelText: 'Quantity',
                    inputType: TextInputType.number,
                    onSave: (val) {},
                    validator: (value) {
                      return validator(value, 'Please enter quantity');
                    },
                  ),
                ),
              ],
            ),
            const ApproveItems(),
            const SizedBox(width: defaultPadding),
            const SizedBox(height: defaultPadding),
            RowBotttomAdd(
              onPressed: widget.onPressed,
            ),
            const AddItemsBlocListener(),
            const EditItemsBlocListener()
          ],
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

