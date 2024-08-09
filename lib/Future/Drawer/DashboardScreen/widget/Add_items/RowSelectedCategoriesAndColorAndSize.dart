import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/select_categories/select_categories.dart';
import '../../../../../widgets/custom_dropdown.dart';
import '../../../../../widgets/multi_select_drop_down.dart';
import '../../logic/cubit/dashboard_cubit.dart';
import '../../logic/cubit/dashboard_state.dart';

class RowSelectedCategoriesAndColorAndSize extends StatelessWidget {
  const RowSelectedCategoriesAndColorAndSize({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
                child: CustomDropdown<SelectCategories>(
              validator: (value) {
                if (value?.name == null || value!.name.isEmpty) {
                  return 'Please enter selestnamecategories';
                }
                return null;
              },
              hintText: context.read<DashboardCubit>().selestnamecategories ??
                  'Select category',
              items: context.read<DashboardCubit>().itemCat,
              displayItem: (SelectCategories? category) => category?.name ?? '',
              onChanged: (newValue) {
                if (newValue != null) {
                  context.read<DashboardCubit>().itemCategories.text =
                      newValue.id.toString();
                }
              },
            )),
            Expanded(
              flex: 1,
              child: MultiSelectDropDown(
                items: context.read<DashboardCubit>().colors,
                onSelectionChanged: (newValue) {
                  context.read<DashboardCubit>().selectedcolors = newValue;
                },
                displayItem: (String item) => item,
                selectedItems: context.read<DashboardCubit>().selectedcolors,
                title: 'Selected Colors',
              ),
            ),
            Expanded(
                child: MultiSelectDropDown(
              items: context.read<DashboardCubit>().sizes,
              onSelectionChanged: (newValue) {
                context.read<DashboardCubit>().selectedSize = newValue;
              },
              displayItem: (String item) => item,
              selectedItems: context.read<DashboardCubit>().selectedSize,
              title: 'selected Sizes',
            )),
          ],
        );
      },
    );
  }
}
