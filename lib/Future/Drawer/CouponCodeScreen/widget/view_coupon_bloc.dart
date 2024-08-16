import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors.dart';
import '../logic/cubit/coupon_cubit.dart';
import '../logic/cubit/coupon_state.dart';
import 'coupon_list_section.dart';

class CouponBlocBuilder extends StatelessWidget {
  const CouponBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CouponCubit, CouponState>(
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
            return CouponListSection(
              coupon: products,
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
