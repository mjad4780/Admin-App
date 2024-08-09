import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Future/Drawer/DashboardScreen/logic/cubit/dashboard_cubit.dart';
import 'package:untitled/Future/Drawer/DashboardScreen/logic/cubit/dashboard_state.dart';
import 'package:untitled/core/function/function_api/ssend_list_api.dart';

import '../../../../../core/networking/api_constants.dart';
import '../../../../../core/theming/colors.dart';
import '../product_list_section.dart';
import '../test.dart';
import '../tester2.dart';

class ItemsBlocBuilder extends StatelessWidget {
  const ItemsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
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
            return Column(
              children: [
                ProductListSection(
                  items: products,
                ),
                // Tester(
                //   products: products,
                // ),

                // Text(
                //   replacMapsIsEnpty(products[4].size!).toString(),
                // ),
                // Tester2(
                //   products: products,
                // )
              ],
            );
            // CategoryListSection(
            //   categories: products.data ?? [],
            // );
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
