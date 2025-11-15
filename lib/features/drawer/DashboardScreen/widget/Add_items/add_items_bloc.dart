import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/drawer/DashboardScreen/logic/cubit/dashboard_cubit.dart';
import 'package:untitled/features/drawer/DashboardScreen/logic/cubit/dashboard_state.dart';
import 'package:untitled/core/extensions/extention_navigator.dart';

import '../../../../../core/function/show_dilaog/top_show_dialog.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/setup_erorr.dart';

class AddItemsBlocListener extends StatelessWidget {
  const AddItemsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardCubit, DashboardState>(
      listenWhen: (previous, current) =>
          current is LoadingAdd || current is SuccessAdd || current is ErorrAdd,
      listener: (context, state) {
        state.whenOrNull(
          loadingAdd: () {
            context.pop();
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppColor.mainBlue,
                ),
              ),
            );
          },
          successAdd: () {
            context.pop();
            topsnackbar(context, 'success add Items');
          },
          erorrAdd: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
