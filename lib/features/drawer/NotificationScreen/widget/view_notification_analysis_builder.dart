import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/drawer/NotificationScreen/logic/cubit/notification_cubit.dart';
import 'package:untitled/features/drawer/NotificationScreen/logic/cubit/notification_state.dart';

import '../../../../core/theming/colors.dart';
import 'view_notification_analysis.dart';

class NotificationAnalysisBlocBuilder extends StatelessWidget {
  const NotificationAnalysisBlocBuilder({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      buildWhen: (previous, current) =>
          current is LoadingViewAnalysis ||
          current is SuccessViewAnalysis ||
          current is ErorrViewAnalysis,
      builder: (context, state) {
        return state.maybeWhen(
          loadingViewAnalysis: () {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.mainBlue,
              ),
            );
          },
          successViewAnalysis: (products) {
            return ViewNotificationAnalysis(
              title: title,
              notification: products,
            );
          },
          erorrViewAnalysis: (error) {
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
