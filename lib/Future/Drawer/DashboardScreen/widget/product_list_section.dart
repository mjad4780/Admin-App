import '../logic/cubit_d/dashboard_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/constants.dart';
import 'package:flutter/material.dart';

import 'add_product_form.dart';
import 'productDataRow.dart';

class ProductListSection extends StatelessWidget {
  const ProductListSection({
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
            "All Products",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
              width: double.infinity,
              child: DataTable(
                columnSpacing: defaultPadding,
                // minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text("Product Name"),
                  ),
                  DataColumn(
                    label: Text("Category"),
                  ),
                  DataColumn(
                    label: Text(" Items Count"),
                  ),
                  DataColumn(
                    label: Text("Price"),
                  ),
                  DataColumn(
                    label: Text("Edit"),
                  ),
                  DataColumn(
                    label: Text("Delete"),
                  ),
                ],
                rows: List.generate(
                  context.read<DashboardsCubit>().products.length,
                  (index) => productDataRow(
                    context.read<DashboardsCubit>().products[index],
                    edit: () {
                      showAddProductForm(context,
                          context.read<DashboardsCubit>().products[index]);
                    },
                    delete: () {
                      //TODO: should complete call deleteProduct
                    },
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
