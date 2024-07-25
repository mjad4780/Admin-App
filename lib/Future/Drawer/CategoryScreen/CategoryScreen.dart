import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/function/showAddForm.dart';
import '../../../utility/constants.dart';

import '../../../widgets/Heder.dart';
import '../../../widgets/RowTitleAndRefresh.dart';
import 'widget/add_category_form.dart';
import 'widget/category_list_section.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              title: 'Category',
            ),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      RowTitleAndRefresh(
                        text: "My Categories",
                        AddonPressed: () {
                          showAddForm(
                            context,
                            'Add Category',
                            CategorySubmitForm(),
                          );
                        },
                        refresh: () {},
                      ),
                      Gap(defaultPadding),
                      CategoryListSection(),
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
