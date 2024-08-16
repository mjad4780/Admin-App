import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Future/Drawer/CouponCodeScreen/logic/cubit/coupon_cubit.dart';
import 'package:untitled/Future/Drawer/CouponCodeScreen/logic/cubit/coupon_state.dart';
import 'package:untitled/core/extensions/extention_navigator.dart';
import '../../../../core/function/show_dilaog/top_show_dialog.dart';
import '../../../../core/widgets/setup_erorr.dart';

import '../../../../core/theming/colors.dart';

class AddCouponBlocListener extends StatelessWidget {
  const AddCouponBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CouponCubit, CouponState>(
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
            topsnackbar(context, 'success add coupon');
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
