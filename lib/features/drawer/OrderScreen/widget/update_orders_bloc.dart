import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled/features/drawer/OrderScreen/logic/cubit/orders_cubit.dart';
import 'package:untitled/features/drawer/OrderScreen/logic/cubit/orders_state.dart';
import 'package:untitled/core/extensions/extention_navigator.dart';
import '../../../../core/function/show_dilaog/top_show_dialog.dart';
import '../../../../core/widgets/setup_erorr.dart';

class UpdateOrdersBlocListener extends StatelessWidget {
  const UpdateOrdersBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrdersCubit, OrdersState>(
      listenWhen: (previous, current) =>
          current is LoadingUpdate ||
          current is SuccessUpdate ||
          current is ErorrUpdate,
      listener: (context, state) {
        state.whenOrNull(
          loadingUpdate: () {
            // context.pop();
            // showDialog(
            //   context: context,
            //   builder: (context) => const Center(
            //     child: CircularProgressIndicator(
            //       color: AppColor.mainBlue,
            //     ),
            //   ),
            // );
          },
          successUpdate: () {
            context.pop();
            topsnackbar(context, 'success Update Orders');
          },
          erorrUpdate: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
