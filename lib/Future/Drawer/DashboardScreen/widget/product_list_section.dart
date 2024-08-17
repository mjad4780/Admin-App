import '../../../../models/response_dashpoard/datum.dart';
import '../logic/cubit/dashboard_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/constants.dart';
import 'package:flutter/material.dart';

import 'add_product_form.dart';
import 'productDataRow.dart';
import 'show_add.dart';

class ProductListSection extends StatelessWidget {
  const ProductListSection({
    super.key,
    required this.items,
  });
  final List<Datum> items;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var dashpord = context.read<DashboardCubit>();

      return BlocProvider.value(
        value: dashpord,
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All Products",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    columnSpacing: defaultPadding,
                    // minWidth: 600,
                    columns: const [
                      DataColumn(
                        label: Text(
                          "Product Name",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Category",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          " Items Count",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Price",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Edit",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Delete",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                    rows: List.generate(
                      items.length,
                      (index) => productDataRow(
                        items[index],
                        edit: () {
                          context.read<DashboardCubit>().pushEdit(items[index]);
                          showAddProductForm(context, ProductSubmitForm(
                            onPressed: () {
                              context
                                  .read<DashboardCubit>()
                                  .editItems(items[index].itemId!);
                            },
                          ));
                        },
                        delete: () {
                          //TODO: should complete call deleteProduct
                        },
                      ),
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
