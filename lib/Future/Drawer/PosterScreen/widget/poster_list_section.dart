import '../../../../models/response_poster/datum.dart';
import '../../../../utility/constants.dart';
import 'package:flutter/material.dart';

import 'posterDataRow.dart';

class PosterListSection extends StatelessWidget {
  const PosterListSection({
    super.key,
    required this.poster,
  });
  final List<Datum> poster;
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
            "All Posters",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
              width: double.infinity,
              child: DataTable(
                columnSpacing: defaultPadding,
                // minWidth: 600,
                columns: const [
                  DataColumn(
                    label: Text("image "),
                  ),
                  DataColumn(
                    label: Text("title"),
                  ),
                  DataColumn(
                    label: Text("body"),
                  ),
                ],
                rows: List.generate(
                  poster.length,
                  (index) => posterDataRow(
                    poster[index],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
