import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/response_categories/datum.dart';
import '../../../../utility/constants.dart';
import 'package:flutter/material.dart';

import '../logic/cubit/categories_cubit.dart';
import 'add_category_form.dart';
import 'categoryDataRow.dart';
import 'show_and_form_dialog.dart';

class CategoryListSection extends StatelessWidget {
  const CategoryListSection({
    super.key,
    required this.categories,
  });

  final List<Datum> categories;
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
            "All Categories",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: MediaQuery.sizeOf(context).width >= 565
                  ? Axis.vertical
                  : Axis.horizontal,
              child: DataTable(
                columnSpacing: defaultPadding,
                // minWidth: 600,
                columns: const [
                  DataColumn(
                    label: Text("Category Name"),
                  ),
                  DataColumn(
                    label: Text("Added Date"),
                  ),
                  DataColumn(
                    label: Text("Edit"),
                  ),
                  DataColumn(
                    label: Text("Delete"),
                  ),
                ],
                rows: List.generate(
                  categories.length,
                  (index) => categoryDataRow(categories[index], delete: () {},
                      edit: () {
                    context
                        .read<CategoriesCubit>()
                        .setDataForUpdateCategory(categories[index], context);
                    showAddForm(
                      context,
                      'Edit Categories',
                      CategorySubmitForm(
                        onPressed: () => context
                            .read<CategoriesCubit>()
                            .editCategories(categories[index].categoriesId!),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
