import '../../../../models/Item.dart';
import 'package:flutter/material.dart';

import '../../../../utility/constants.dart';

DataRow productDataRow(ItemsModel productInfo,
    {Function? edit, Function? delete}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Image.network(
              productInfo.itemsImage ?? '',
              height: 30,
              width: 30,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Icon(Icons.error);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(productInfo.itemsName ?? ''),
            ),
          ],
        ),
      ),
      DataCell(Text(productInfo.categoriesName ?? '')),
      DataCell(Text(productInfo.itemsCount.toString())),
      DataCell(
        Text('${productInfo.itemsPrice}'),
      ),
      DataCell(IconButton(
          onPressed: () {
            if (edit != null) edit();
          },
          icon: Icon(
            Icons.edit,
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
