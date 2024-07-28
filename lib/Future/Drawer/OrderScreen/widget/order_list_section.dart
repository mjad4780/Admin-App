import '../../../../models/response_orders/datum.dart';
import '../logic/cubit/orders_cubit.dart';

import '../../../../utility/constants.dart';
import 'ShowDilogOrders.dart';
import 'orderDataRow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_order_form.dart';

class OrderListSection extends StatelessWidget {
  const OrderListSection({
    super.key,
    required this.order,
  });
  final List<Datum> order;
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
            "All Order",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
              width: double.infinity,
              child: DataTable(
                columnSpacing: defaultPadding,
                columns: const [
                  DataColumn(
                    label: Text(
                      "Customer Name",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Total Price Order",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Payment",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Status",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Date",
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
                rows: rowtable(context),
              )),
        ],
      ),
    );
  }

  List<DataRow> rowtable(BuildContext context) {
    return List.generate(
      order.length,
      (index) => orderDataRow(order[index], index + 1, delete: () {}, edit: () {
        context
            .read<OrdersCubit>()
            .viewdetails(order[index].ordersId!, order[index].adressUserid!);
        context.read<OrdersCubit>().orderStatus(order[index].ordersStatus!);
        showOrderForm(
          context,
          OrderSubmitForm(order: order[index]),
        );
      }),
    );
  }
}
