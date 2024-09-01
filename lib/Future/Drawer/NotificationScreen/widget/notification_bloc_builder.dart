import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Future/Drawer/NotificationScreen/logic/cubit/notification_cubit.dart';
import 'package:untitled/Future/Drawer/NotificationScreen/logic/cubit/notification_state.dart';

import '../../../../core/theming/colors.dart';
import 'notification_list_section.dart';

class NotificationBlocBuilder extends StatelessWidget {
  const NotificationBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      buildWhen: (previous, current) =>
          current is LoadingView ||
          current is SuccessView ||
          current is ErorrView,
      builder: (context, state) {
        return state.maybeWhen(
          loadingView: () {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.mainBlue,
              ),
            );
          },
          successView: (products) {
            return NotificationListSection(
              data: products.data ?? [],
            );
          },
          erorrView: (error) {
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
