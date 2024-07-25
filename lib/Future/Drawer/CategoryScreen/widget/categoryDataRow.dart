import 'package:flutter/material.dart';

import '../../../../models/category.dart';
import '../../../../utility/constants.dart';

DataRow categoryDataRow(CategoryModel CatInfo,
    {Function? edit, Function? delete}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Image.network(
              CatInfo.image ?? ' ',
              height: 30,
              width: 30,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Icon(Icons.error);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(CatInfo.name ?? ' '),
            ),
          ],
        ),
      ),
      // DataCell(Text(CatInfo.createdAt ?? ' ')),
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
