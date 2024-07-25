import '../../../core/get_it/get_it.dart';
import '../../../widgets/Heder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../utility/constants.dart';
import 'logic/cubit/notification_cubit.dart';
import 'widget/notification_list_section.dart';
import 'widget/send_notification_form.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => getIt<NotificationCubit>(),
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: 'Notification'),
            Gap(defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "My Notification",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          ElevatedButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding * 1.5,
                                vertical: defaultPadding,
                              ),
                            ),
                            onPressed: () {
                              showAddFormnoti(
                                context,
                                'Send Notification',
                              );
                              // sendNotificationFormForm(context);
                            },
                            icon: Icon(Icons.add),
                            label: Text("Send New"),
                          ),
                          Gap(20),
                          IconButton(
                              onPressed: () {
                                //TODO: should complete call getAllNotifications
                              },
                              icon: Icon(Icons.refresh)),
                        ],
                      ),
                      Gap(defaultPadding),
                      NotificationListSection(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
