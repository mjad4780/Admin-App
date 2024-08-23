import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../models/response_dashpoard/datum.dart';
import '../../../../models/response_dashpoard/order.dart';
import '../../../../utility/constants.dart';
import '../../../../widgets/Heder.dart';
import '../logic/cubit/dashboard_cubit.dart';
import 'add_product2.dart';
import 'add_product_form.dart';
import 'order_details_section.dart';
import 'product_list_section.dart';
import 'product_summery_section.dart';
import 'show_add.dart';

class DashboardMobileBody extends StatelessWidget {
  const DashboardMobileBody({
    super.key,
    required this.order,
    required this.items,
  });
  final Order order;
  final List<Datum> items;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(
          title: 'Dashboard',
        ),
        const Gap(defaultPadding),
        Column(
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
                      context.read<DashboardCubit>().removeControlerpushAdd();
                      showAddProductForm(
                          context,
                          MediaQuery.sizeOf(context).width <= 500
                              ? ProductSubmitForm2(
                                  onPressed: () {
                                    context
                                        .read<DashboardCubit>()
                                        .addItems(context);
                                  },
                                )
                              : ProductSubmitForm(
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
        const SizedBox(height: defaultPadding),
        OrderDetailsSection(
          order: order,
        ),
      ],
    ));
  }
}
