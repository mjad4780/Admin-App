import 'package:untitled/core/get_it/get_it.dart';

import '../../../models/response_dashboard/datum.dart';
import '../../../models/response_dashboard/order.dart';
import 'logic/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../utility/constants.dart';
import '../../../widgets/Heder.dart';
import 'widget/add_product_form.dart';

import 'widget/order_details_section.dart';
import 'widget/product_list_section.dart';
import 'widget/product_summery_section.dart';
import 'widget/show_add.dart';
import 'widget/view_dashbord/get_dashbord_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocProvider(
        create: (context) => getIt<DashboardCubit>()..viewashboard(),
        child: const SafeArea(
            child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: DasboardBlocBuilder(),
        )),
      );
    });
  }
}

class DashboardBody extends StatelessWidget {
  const DashboardBody({
    super.key,
    required this.order,
    required this.items,
  });
  final Order order;
  final List<ItemsData> items;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                            context
                                .read<DashboardCubit>()
                                .removeControlerpushAdd();
                            showAddProductForm(context, ProductSubmitForm(
                              onPressed: () {
                                context
                                    .read<DashboardCubit>()
                                    .addItems(context);
                              },
                            ));
                          },
                          icon: const Icon(Icons.add),
                          label: const Text("Add New"),
                        );
                      }),
                      const Gap(20),
                      IconButton(
                          onPressed: () {
                            context.read<DashboardCubit>().viewashboard();
                            //TODO: should complete call getAllProduct
                          },
                          icon: const Icon(Icons.refresh)),
                    ],
                  ),
                  const Gap(defaultPadding),
                  const ProductSummerySection(),
                  const Gap(defaultPadding),
                  ProductListSection(
                    items: items,
                  ),

                  /////////////////////   // const ItemsBlocBuilder(),
                ],
              ),
            ),
            const SizedBox(width: defaultPadding),
            Expanded(
              flex: 2,
              child: OrderDetailsSection(
                order: order,
              ),
            ),
          ],
        )
      ],
    );
  }
}
