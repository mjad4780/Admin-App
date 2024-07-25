import 'FormRow.dart';
import 'package:flutter/material.dart';

import '../../../../models/ordersmodel.dart';
import '../../../../utility/constants.dart';

class paymentDetailsSection extends StatelessWidget {
  const paymentDetailsSection({super.key, required this.order});
  final OrdersModel order;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        border: Border.all(color: Colors.blueAccent),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Payment Details',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
          ),
          FormRow(
              text: 'Payment Method:',
              widget: Text(order.ordersPaymentmethod.toString(),
                  style: TextStyle(fontSize: 16))),
          // formRow(
          //     'Coupon Code:',
          //     Text(order?.ordersCoupon.toString() ?? 'N/A',
          //         style: TextStyle(fontSize: 16))),
          FormRow(
              text: 'Order Sub Total:',
              widget: Text(
                  '\$${order.ordersPrice?.toStringAsFixed(2) ?? 'N/A'}',
                  style: TextStyle(fontSize: 16))),
          FormRow(
              text: 'Discount:',
              widget: Text(
                  '\$${order.ordersCoupon?.toStringAsFixed(2) ?? 'N/A'}',
                  style: TextStyle(fontSize: 16, color: Colors.red))),
          FormRow(
              text: 'Grand Total:',
              widget: Text(
                  '\$${order.ordersTotalprice?.toStringAsFixed(2) ?? 'N/A'}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}