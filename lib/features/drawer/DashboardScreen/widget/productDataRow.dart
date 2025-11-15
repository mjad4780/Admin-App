import 'package:flutter/material.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../models/response_dashpoard/datum.dart';

DataRow productDataRow(BuildContext context, Datum productInfo,
    {Function? edit, Function? delete}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Image.network(
              '${ApiConstants.imageItem}/${productInfo.itemImage} ',
              height: 30,
              width: 30,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const Icon(Icons.error);
              },
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              productInfo.itemName ?? '',
              style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).width >= 450 ? 16 : 10),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      // DataCell(Text(productInfo.itemCount.toString())),
      // DataCell(
      //   Text('${productInfo.itemPrice}'),
      // ),
      DataCell(IconButton(
          onPressed: () {
            if (edit != null) edit();
          },
          icon: const Icon(
            Icons.edit,
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
