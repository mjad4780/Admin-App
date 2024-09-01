import 'package:flutter/material.dart';
import 'package:untitled/models/response_notification/datum.dart';
import '../../../../utility/color_list.dart';
import '../../../../utility/constants.dart';

DataRow notificationDataRow(Datum notificationInfo, int index,
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
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(notificationInfo.notificationTitle ?? ''),
            ),
          ],
        ),
      ),
      DataCell(Text(notificationInfo.notificationBody ?? '')),
      DataCell(Text(notificationInfo.notificationDatetime ?? '')),
      DataCell(IconButton(
          onPressed: () {
            if (edit != null) edit();
          },
          icon: const Icon(
            Icons.remove_red_eye_sharp,
            color: Colors.white,
          ))),
      DataCell(IconButton(
          onPressed: () {
            if (delete != null) delete();
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ))),
    ],
  );
}
