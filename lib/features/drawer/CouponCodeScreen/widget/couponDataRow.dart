import 'package:flutter/material.dart';

import '../../../../models/response_coupon/datum.dart';
import '../../../../utility/color_list.dart';
import '../../../../utility/constants.dart';

DataRow couponDataRow(Datum coupon, int index,
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
              child: Text(coupon.couponName ?? ''),
            ),
          ],
        ),
      ),
      DataCell(Text(coupon.couponDiscount.toString())),
      DataCell(Text(coupon.coponMaxuser.toString())),
      DataCell(Text(coupon.couponData ?? '')),
      DataCell(Text(coupon.coponEndDate ?? '')),
    ],
  );
}
