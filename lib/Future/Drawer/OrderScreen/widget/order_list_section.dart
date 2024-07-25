import '../logic/cubit_r/orders_cubit.dart';

import '../../../../utility/constants.dart';
import 'ShowDilogOrders.dart';
import 'orderDataRow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderListSection extends StatelessWidget {
  const OrderListSection({
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
            "All Order",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
              width: double.infinity,
              child: DataTable(
                columnSpacing: defaultPadding,
                // minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text("Customer Name"),
                  ),
                  DataColumn(
                    label: Text("Order Amount"),
                  ),
                  DataColumn(
                    label: Text("Payment"),
                  ),
                  DataColumn(
                    label: Text("Status"),
                  ),
                  DataColumn(
                    label: Text("Date"),
                  ),
                  DataColumn(
                    label: Text("Edit"),
                  ),
                  DataColumn(
                    label: Text("Delete"),
                  ),
                ],
                rows: List.generate(
                  context.read<OrdersCubit>().orderData.length,
                  (index) => orderDataRow(
                      context.read<OrdersCubit>().orderData[index], index + 1,
                      delete: () {
                    //TODO: should complete call deleteOrder
                  }, edit: () {
                    showOrderForm(
                        context, context.read<OrdersCubit>().orderData[index]);
                  }),
                ),
              )),
        ],
      ),
    );
  }
}
