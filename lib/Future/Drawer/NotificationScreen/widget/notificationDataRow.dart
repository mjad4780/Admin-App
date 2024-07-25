import 'package:flutter/material.dart';

import '../../../../models/Notification.dart';
import '../../../../utility/color_list.dart';
import '../../../../utility/constants.dart';

DataRow notificationDataRow(NotificationModel notificationInfo, int index,
    {Function? edit, Function? delete}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: colors[index % colors.length],
                shape: BoxShape.circle,
              ),
              child: Text(index.toString(), textAlign: TextAlign.center),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(notificationInfo.title ?? ''),
            ),
          ],
        ),
      ),
      DataCell(Text(notificationInfo.body ?? '')),
      DataCell(Text(notificationInfo.datetime ?? '')),
      DataCell(IconButton(
          onPressed: () {
            if (edit != null) edit();
          },
          icon: Icon(
            Icons.remove_red_eye_sharp,
            color: Colors.white,
          ))),
      DataCell(IconButton(
          onPressed: () {
            if (delete != null) delete();
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ))),
    ],
  );
}
