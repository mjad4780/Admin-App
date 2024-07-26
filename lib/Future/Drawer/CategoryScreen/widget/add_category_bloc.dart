import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/extensions/extention_navigator.dart';
import '../../../../core/widgets/setup_erorr.dart';

import '../../../../core/theming/colors.dart';
import '../logic/cubit/categories_cubit.dart';
import '../logic/cubit/categories_state.dart';

class AddCategoriesBlocListener extends StatelessWidget {
  const AddCategoriesBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesCubit, CategoriesState>(
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
