import 'package:flutter/material.dart';
import 'package:untitled/models/response_orders/datum.dart';

import '../../../../core/theming/styles.dart';
import '../../../../utility/constants.dart';
import 'FormRow.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key, required this.order});
  final Datum order;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(defaultPadding),
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
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Shipping Address', style: TextStyles.adress(context)),
          ),
          FormRow(
              text: 'Phone:',
              widget: Text('0128888888',
                  style: TextStyles.stylesectionreqler(context))),
          FormRow(
              text: 'Street:',
              widget: Text(order.adressStreet ?? 'N/A',
                  style: TextStyles.stylesectionreqler(context))),
          FormRow(
              text: 'City:',
              widget: Text(order.adressCity ?? 'N/A',
                  style: TextStyles.stylesectionreqler(context))),
          FormRow(
              text: 'Country:',
              widget: Text(order.adressName ?? 'N/A',
                  style: TextStyles.stylesectionreqler(context))),
        ],
      ),
    );
  }
}
