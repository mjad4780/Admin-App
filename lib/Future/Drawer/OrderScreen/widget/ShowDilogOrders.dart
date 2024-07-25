import 'view_order_form.dart';
import 'package:flutter/material.dart';

import '../../../../models/ordersmodel.dart';
import '../../../../utility/constants.dart';

void showOrderForm(BuildContext context, OrdersModel? order) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: bgColor,
        title: Center(
            child: Text('Order Details'.toUpperCase(),
                style: TextStyle(color: primaryColor))),
        content: OrderSubmitForm(order: order),
      );
    },
  );
}
