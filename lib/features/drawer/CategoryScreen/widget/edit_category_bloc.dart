import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/extensions/extention_navigator.dart';

import '../../../../core/function/show_dilaog/top_show_dialog.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/setup_erorr.dart';
import '../logic/cubit/categories_cubit.dart';
import '../logic/cubit/categories_state.dart';

class EditcategoriesBlocListener extends StatelessWidget {
  const EditcategoriesBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesCubit, CategoriesState>(
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
            topsnackbar(context, 'success edit Categories');
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
