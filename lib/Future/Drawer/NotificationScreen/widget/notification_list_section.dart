import '../logic/cubit/notification_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/constants.dart';

import 'notificationDataRow.dart';
import 'view_notification_form.dart';
import 'package:flutter/material.dart';

class NotificationListSection extends StatelessWidget {
  const NotificationListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Notification",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
              width: double.infinity,
              child: DataTable(
                columnSpacing: defaultPadding,
                // minWidth: 600,
                columns: const [
                  DataColumn(
                    label: Text("Title"),
                  ),
                  DataColumn(
                    label: Text("Description"),
                  ),
                  DataColumn(
                    label: Text("Send Date"),
                  ),
                  DataColumn(
                    label: Text("View"),
                  ),
                  DataColumn(
                    label: Text("Delete"),
                  ),
                ],
                rows: List.generate(
                  context.read<NotificationCubit>().allNotifications.length,
                  (index) => notificationDataRow(
                      context.read<NotificationCubit>().allNotifications[index],
                      index + 1, edit: () {
                    viewNotificationStatics(
                        context,
                        context
                            .read<NotificationCubit>()
                            .allNotifications[index]);
                  }, delete: () {
                    //TODO: should complete call deleteNotification
                  }),
                ),
              )),
        ],
      ),
    );
  }
}
