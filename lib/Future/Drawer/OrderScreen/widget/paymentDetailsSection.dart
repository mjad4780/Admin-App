import 'package:untitled/core/theming/styles.dart';
import 'package:untitled/models/response_orders/datum.dart';

import 'FormRow.dart';
import 'package:flutter/material.dart';

import '../../../../utility/constants.dart';

class PaymentDetailsSection extends StatelessWidget {
  const PaymentDetailsSection({super.key, required this.order});
  final Datum order;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        border: Border.all(color: Colors.blueAccent),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Payment Details',
              style: TextStyles.adress(context),
            ),
          ),
          FormRow(
              text: 'Payment Method:',
              widget: Text(order.ordersPaymentmets.toString(),
                  style: TextStyles.stylesectionreqler(context))),
          // formRow(
          //     'Coupon Code:',
          //     Text(order?.ordersCoupon.toString() ?? 'N/A',
          //         style: TextStyle(fontSize: 16))),
          FormRow(
              text: 'Order Sub Total:',
              widget: Text(
                  '\$${order.ordersPrice?.toStringAsFixed(2) ?? 'N/A'}',
                  style: TextStyles.stylesectionreqler(context))),
          FormRow(
              text: 'Discount:',
              widget: Text(
                  '\$${order.ordersCoupon?.toStringAsFixed(2) ?? 'N/A'}',
                  style: TextStyles.stylesection(context))),
          FormRow(
              text: 'Grand Total:',
              widget: Text(
                  '\$${order.orderToatalprice?.toStringAsFixed(2) ?? 'N/A'}',
                  style: TextStyles.stylesectionreqler(context))),
        ],
      ),
    );
  }
}
