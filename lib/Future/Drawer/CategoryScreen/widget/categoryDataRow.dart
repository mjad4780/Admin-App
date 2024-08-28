import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/response_categories/datum.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../utility/constants.dart';

DataRow categoryDataRow(Datum categories, {Function? edit, Function? delete}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            CachedNetworkImage(
              imageUrl:
                  '${ApiConstants.imageCat}/${categories.categoriesImage} ',
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(categories.categoriesName ?? ' '),
            ),
          ],
        ),
      ),
      DataCell(Text(categories.categoriesData ?? ' ')),
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
