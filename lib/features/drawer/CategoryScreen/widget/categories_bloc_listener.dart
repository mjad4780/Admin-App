import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/drawer/CategoryScreen/logic/cubit/categories_cubit.dart';
import 'package:untitled/features/drawer/CategoryScreen/logic/cubit/categories_state.dart';

import '../../../../core/theming/colors.dart';
import 'category_list_section.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      buildWhen: (previous, current) =>
          current is Loadingview ||
          current is Successview ||
          current is Erorrview,
      builder: (context, state) {
        return state.maybeWhen(
          loadingview: () {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.mainBlue,
              ),
            );
          },
          successview: (products) {
            return CategoryListSection(
              categories: products.data ?? [],
            );
          },
          erorrview: (error) {
            return Text(error);
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
