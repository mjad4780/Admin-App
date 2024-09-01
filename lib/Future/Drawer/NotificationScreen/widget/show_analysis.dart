import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Future/Drawer/NotificationScreen/logic/cubit/notification_cubit.dart';
import '../../../../utility/constants.dart';

void viewNotificationStatics(BuildContext context, Widget widget) {
  var value = context.read<NotificationCubit>();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocProvider.value(
        value: value,
        child: AlertDialog(
          backgroundColor: bgColor,
          title: Center(
              child: Text('Notification Statics'.toUpperCase(),
                  style: const TextStyle(color: primaryColor))),
          content: widget,
        ),
      );
    },
  );
}
