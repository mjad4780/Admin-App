import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/drawer/OrderScreen/logic/cubit/orders_cubit.dart';
import 'package:untitled/features/drawer/OrderScreen/logic/cubit/orders_state.dart';

import '../../../../core/theming/colors.dart';
import 'itemsSection.dart';

class DetailsBlocBuilder extends StatelessWidget {
  const DetailsBlocBuilder({super.key, required this.tatalPrice});
  final int tatalPrice;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      buildWhen: (previous, current) =>
          current is Loadingviewdetails ||
          current is successviewdetails ||
          current is Erorrviewdetails,
      builder: (context, state) {
        return state.maybeWhen(
          loadingviewdetails: () {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.mainBlue,
              ),
            );
          },
          successviewdetails: (products) {
            return ItemSection(
              details: products,
              totalPrice: tatalPrice,
            );

            // TableDetails(
            //   details: products,
            // );
          },
          erorrviewdetails: (error) {
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
