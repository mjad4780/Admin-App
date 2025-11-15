import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/response_notification/datum.dart';
import '../../../../utility/constants.dart';

import '../logic/cubit/notification_cubit.dart';
import 'notification_data_row.dart';
import 'package:flutter/material.dart';

import 'show_analysis.dart';
import 'view_notification_analysis_builder.dart';

class NotificationListSection extends StatelessWidget {
  const NotificationListSection({
    super.key,
    required this.data,
  });
  final List<Datum> data;

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
              child: SingleChildScrollView(
                scrollDirection: MediaQuery.sizeOf(context).width >= 650
                    ? Axis.vertical
                    : Axis.horizontal,
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
                    data.length,
                    (index) => notificationDataRow(data[index], index + 1,
                        edit: () async {
                      await context
                          .read<NotificationCubit>()
                          .viewAnalysis(data[index].notificationIdSignal ?? '');
                      // ignore: use_build_context_synchronously
                      viewNotificationStatics(
                          context,
                          NotificationAnalysisBlocBuilder(
                              title: data[index].notificationTitle ?? ''));
                    }, delete: () {}),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
