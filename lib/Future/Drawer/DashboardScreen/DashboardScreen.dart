import 'package:untitled/core/get_it/get_it.dart';

import 'logic/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../utility/constants.dart';
import '../../../widgets/Heder.dart';
import 'widget/Add_items/add_items_bloc.dart';
import 'widget/add_product_form.dart';

import 'widget/show_add.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DashboardCubit>(),
      child: SafeArea(
          child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(
              title: 'Dashboard',
            ),
            const Gap(defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "My Products",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Builder(builder: (context) {
                            return ElevatedButton.icon(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding * 1.5,
                                  vertical: defaultPadding,
                                ),
                              ),
                              onPressed: () {
                                showAddProductForm(
                                    context, const ProductSubmitForm());
                              },
                              icon: const Icon(Icons.add),
                              label: const Text("Add New"),
                            );
                          }),
                          const Gap(20),
                          IconButton(
                              onPressed: () {
                                //TODO: should complete call getAllProduct
                              },
                              icon: const Icon(Icons.refresh)),
                        ],
                      ),
                      const Gap(defaultPadding),
                      // const ProductSummerySection(),
                      const Gap(defaultPadding),
                      // const ProductListSection(),
                    ],
                  ),
                ),

                const SizedBox(width: defaultPadding),
                // const Expanded(
                //   flex: 2,
                //   child: OrderDetailsSection(),
                // ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
