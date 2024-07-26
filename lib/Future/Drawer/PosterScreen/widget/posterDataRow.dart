import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../models/response_poster/datum.dart';
import '../../../../utility/constants.dart';

DataRow posterDataRow(
  Datum poster,
) {
  return DataRow(
    cells: [
      DataCell(
        CachedNetworkImage(
          imageUrl: '${ApiConstants.imageposter}/${poster.settingImage}',
          height: 30,
          width: 30,
        ),
      ),
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(poster.settingTitle ?? ''),
        ),
      ),
      DataCell(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(poster.settingBody ?? ''),
        ),
      ),
    ],
  );
}
