import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Future/Drawer/DashboardScreen/logic/cubit/dashboard_cubit.dart';
import 'package:untitled/Future/Drawer/DashboardScreen/logic/cubit/dashboard_state.dart';
import 'package:untitled/core/extensions/extention_navigator.dart';

import '../../../../../core/function/show_dilaog/top_show_dialog.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/setup_erorr.dart';

class EditItemsBlocListener extends StatelessWidget {
  const EditItemsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardCubit, DashboardState>(
      listenWhen: (previous, current) =>
          current is Loadingedit ||
          current is Successedit ||
          current is Erorredit,
      listener: (context, state) {
        state.whenOrNull(
          loadingedit: () {
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
          successedit: () {
            context.pop();
            topsnackbar(context, 'success edit Items');
          },
          erorredit: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
