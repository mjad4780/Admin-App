import '../../../../models/notification_analysis/notification_analysis_model.dart';

import '../../../../utility/constants.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'notification_statics_card.dart';

class ViewNotificationAnalysis extends StatelessWidget {
  final NotificationAnalysisModel? notification;
  final String title;

  const ViewNotificationAnalysis(
      {super.key, this.notification, required this.title});
  double calculatePercentage(int notificationCount) {
    if (notification!.successful == 0) {
      return 0;
    } else {
      return (notificationCount / notification!.successful!) * 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        width: size.width * 0.5, // Adjust width based on screen size
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const Gap(10),
            Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  color: secondaryColor, // Light grey background to stand out
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                      color: Colors.blueAccent), // Blue border for emphasis
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NotificationCard(
                      text: 'Total Send',
                      color: Colors.blue,
                      number: notification!.successful ?? 0,
                      percentage:
                          calculatePercentage(notification!.successful ?? 0),
                    ),
                    NotificationCard(
                      text: 'Total Opened',
                      color: Colors.green,
                      number: notification!.converted ?? 0,
                      percentage:
                          calculatePercentage(notification!.converted ?? 0),
                    ),
                    NotificationCard(
                      text: 'Total Failed',
                      color: Colors.red,
                      number: notification!.failed ?? 0,
                      percentage:
                          calculatePercentage(notification!.failed ?? 0),
                    ),
                    NotificationCard(
                      text: 'Total Error',
                      color: Colors.yellow,
                      number: notification!.errored ?? 0,
                      percentage:
                          calculatePercentage(notification!.errored ?? 0),
                    ),
                  ],
                )),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: secondaryColor),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// How to show the order popup

