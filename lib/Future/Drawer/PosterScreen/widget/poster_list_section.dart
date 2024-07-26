import '../../../../utility/constants.dart';
import 'add_poster_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'posterDataRow.dart';

class PosterListSection extends StatelessWidget {
  const PosterListSection({
    super.key,
  });

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
                    label: Text("Category Name"),
                  ),
                  DataColumn(
                    label: Text("Edit"),
                  ),
                  DataColumn(
                    label: Text("Delete"),
                  ),
                ],
                rows: const [],
                // rows: List.generate(
                //   context.read<PosterCubit>().Posters.length,
                //   (index) => posterDataRow(
                //       context.read<PosterCubit>().Posters[index], delete: () {
                //     //TODO: should complete call deletePoster
                //   }, edit: () {
                //     showAddForm(
                //         context,
                //         'Edit Posters',
                //         PosterSubmitForm(
                //             poster:
                //                 context.read<PosterCubit>().Posters[index]));
                //   }),
                // ),
              )),
        ],
      ),
    );
  }
}
