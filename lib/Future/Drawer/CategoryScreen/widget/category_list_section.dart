import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/function/showAddForm.dart';
import '../../../../utility/constants.dart';
import 'package:flutter/material.dart';

import '../logic/CategoryScreen_cubit/category_cubit.dart';
import 'add_category_form.dart';
import 'categoryDataRow.dart';

class CategoryListSection extends StatelessWidget {
  const CategoryListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
            child: DataTable(
              columnSpacing: defaultPadding,
              // minWidth: 600,
              columns: [
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
                context.read<CategoryCubit>().categories.length,
                (index) => categoryDataRow(
                    context.read<CategoryCubit>().categories[index],
                    delete: () {}, edit: () {
                  showAddForm(
                    context,
                    'Edit Categories',
                    CategorySubmitForm(),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
