import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/constants.dart';
import '../logic/cubit/notification_cubit.dart';

void showSendNotification(
  BuildContext context,
  String? text,
  Widget widget,
) {
  var value = context.read<NotificationCubit>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: value,
        child: AlertDialog(
            backgroundColor: bgColor,
            title: Center(
                child: Text(text!.toUpperCase(),
                    style: const TextStyle(color: primaryColor))),
            content: widget),
      );
    },
  );
}
