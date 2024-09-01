import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Future/Drawer/NotificationScreen/logic/cubit/notification_cubit.dart';
import 'package:untitled/Future/Drawer/NotificationScreen/logic/cubit/notification_state.dart';
import 'package:untitled/core/extensions/extention_navigator.dart';
import '../../../../core/function/show_dilaog/top_show_dialog.dart';
import '../../../../core/widgets/setup_erorr.dart';

import '../../../../core/theming/colors.dart';

class SendNotificationBloc extends StatelessWidget {
  const SendNotificationBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationCubit, NotificationState>(
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
            topsnackbar(context, 'success Send Notification');

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
