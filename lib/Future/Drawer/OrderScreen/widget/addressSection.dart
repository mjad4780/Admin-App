import 'package:flutter/material.dart';

import '../../../../models/ordersmodel.dart';
import '../../../../utility/constants.dart';
import 'FormRow.dart';

class addressSection extends StatelessWidget {
  const addressSection({super.key, required this.order});
  final OrdersModel order;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor, // Light grey background to stand out
        borderRadius: BorderRadius.circular(8.0),
        border:
            Border.all(color: Colors.blueAccent), // Blue border for emphasis
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Shipping Address',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
          ),
          FormRow(
              text: 'Phone:',
              widget: Text('0128888888', style: TextStyle(fontSize: 16))),
          FormRow(
              text: 'Street:',
              widget: Text(order.addressStreet ?? 'N/A',
                  style: TextStyle(fontSize: 16))),
          FormRow(
              text: 'City:',
              widget: Text(order.addressCity ?? 'N/A',
                  style: TextStyle(fontSize: 16))),
          FormRow(
              text: 'Country:',
              widget: Text(order.addressName ?? 'N/A',
                  style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
