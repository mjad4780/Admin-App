import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Future/Drawer/DashboardScreen/logic/cubit/dashboard_cubit.dart';
import 'package:untitled/Future/Drawer/DashboardScreen/logic/cubit/dashboard_state.dart';

import '../../../../../core/theming/colors.dart';
import '../../DashboardScreen.dart';

class DasboardBlocBuilder extends StatelessWidget {
  const DasboardBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      buildWhen: (previous, current) =>
          current is LoadingDashboard ||
          current is SuccessDashboard ||
          current is ErorrDashboard,
      builder: (context, state) {
        return state.maybeWhen(
          loadingDashboard: () {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.mainBlue,
              ),
            );
          },
          successDashboard: (products) {
            return DashboardBody(
              order: products.orders!.first,
              items: products.data ?? [],
            );
          },
          erorrDashboard: (error) {
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
