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
              hintText: context.read<DashboardCubit>().selestnamecategories ??
                  'Select category',
              items: context.read<DashboardCubit>().itemCat,
              displayItem: (SelectCategories? category) => category?.name ?? '',
              onChanged: (newValue) {
                if (newValue != null) {
                  // context.read<DashboardCubit>().selestname =
                  //     newValue.name;
                  print('ffffffffffff${newValue.id}');
                }
              },
            )),
            Expanded(
              flex: 1,
              child: MultiSelectDropDown(
                items: context.read<DashboardCubit>().selectedcolors,
                onSelectionChanged: (newValue) {
                  context.read<DashboardCubit>().selectedcolors = newValue;
                  print(context.read<DashboardCubit>().selectedcolors);
                },
                displayItem: (String item) => item,
                selectedItems: context.read<DashboardCubit>().colors,
                title: 'Selected Colors',
              ),
            ),
            Expanded(
                child: MultiSelectDropDown(
              items: context.read<DashboardCubit>().sizes,
              onSelectionChanged: (newValue) {
                context.read<DashboardCubit>().selectedSize = newValue;
                print(context.read<DashboardCubit>().sizes);
              },
              displayItem: (String item) => item,
              selectedItems: context.read<DashboardCubit>().sizes,
              title: 'Selected Sizes',
            )),
          ],
        );
      },
    );
  }
}
