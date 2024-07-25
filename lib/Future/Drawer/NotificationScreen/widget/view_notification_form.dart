import '../../../../core/get_it/get_it.dart';
import '../logic/cubit/notification_cubit.dart';
import '../../../../models/Notification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/constants.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import 'notification_statics_card.dart';

class ViewNotificationForm extends StatelessWidget {
  final NotificationModel? notification;

  const ViewNotificationForm({Key? key, this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //TODO: should complete getNotificationInfo
    return BlocProvider(
      create: (context) => getIt<NotificationCubit>()..hhh(),
      child: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(defaultPadding),
              width: size.width * 0.5, // Adjust width based on screen size
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(notification?.title ?? 'N/A',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Gap(10),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                        color:
                            secondaryColor, // Light grey background to stand out
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color:
                                Colors.blueAccent), // Blue border for emphasis
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NotificationCard(
                            text: 'Total Send',
                            color: Colors.blue,
                            number:
                                context.read<NotificationCubit>().totalSend!,
                            percentage: context
                                .read<NotificationCubit>()
                                .calculatePercentage(context
                                    .read<NotificationCubit>()
                                    .totalSend!),
                          ),
                          NotificationCard(
                            text: 'Total Opened',
                            color: Colors.green,
                            number:
                                context.read<NotificationCubit>().totalOpened!,
                            percentage: context
                                .read<NotificationCubit>()
                                .calculatePercentage(context
                                    .read<NotificationCubit>()
                                    .totalOpened!),
                          ),
                          NotificationCard(
                            text: 'Total Failed',
                            color: Colors.red,
                            number:
                                context.read<NotificationCubit>().totalFailed!,
                            percentage: context
                                .read<NotificationCubit>()
                                .calculatePercentage(context
                                    .read<NotificationCubit>()
                                    .totalOpened!),
                          ),
                          NotificationCard(
                            text: 'Total Error',
                            color: Colors.yellow,
                            number:
                                context.read<NotificationCubit>().totalError!,
                            percentage: context
                                .read<NotificationCubit>()
                                .calculatePercentage(context
                                    .read<NotificationCubit>()
                                    .totalError!),
                          ),
                        ],
                      )),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryColor),
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// How to show the order popup
void viewNotificationStatics(
    BuildContext context, NotificationModel? notification) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: bgColor,
        title: Center(
            child: Text('Notification Statics'.toUpperCase(),
                style: TextStyle(color: primaryColor))),
        content: ViewNotificationForm(notification: notification),
      );
    },
  );
}
