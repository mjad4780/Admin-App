import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:untitled/features/drawer/CategoryScreen/logic/cubit/categories_cubit.dart';
import 'package:untitled/features/drawer/CategoryScreen/widget/add_category_bloc.dart';
import 'package:untitled/features/drawer/CategoryScreen/widget/edit_category_bloc.dart';
import '../../../utility/constants.dart';

import '../../../widgets/Heder.dart';
import '../../../widgets/RowTitleAndRefresh.dart';
import 'widget/add_category_form.dart';
import 'widget/categories_bloc_listener.dart';
import 'widget/show_and_form_dialog.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(
              title: 'Category',
            ),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      RowTitleAndRefresh(
                        text: "My Categories",
                        addonPressed: () {
                          context.read<CategoriesCubit>().namear.clear();
                          context.read<CategoriesCubit>().name.clear();
                          context.read<CategoriesCubit>().image = null;
                          showAddForm(
                            context,
                            'Add Category',
                            CategorySubmitForm(
                              onPressed: () {
                                context
                                    .read<CategoriesCubit>()
                                    .addCategories(context);
                              },
                            ),
                          );
                        },
                        refresh: () {
                          context.read<CategoriesCubit>().viewCategories();
                        },
                      ),
                      const Gap(defaultPadding),
                      const CategoriesBlocBuilder(),
                      const AddCategoriesBlocListener(),
                      const EditcategoriesBlocListener()
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
