import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../models/response_detilas/datum.dart';
import '../../../../utility/constants.dart';

class ItemSection extends StatelessWidget {
  const ItemSection({
    super.key,
    required this.totalPrice,
    required this.details,
  });
  final List<DataDetails> details;

  final int totalPrice;
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
      child: Table(
        children: [
          const TableRow(children: [
            Text("Item",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold)),
            Text("Count",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold)),
            Text("ItemPrice",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold))
          ]),
          ...List.generate(
              details.length,
              (index) => TableRow(children: [
                    Text('${details[index].itemName}',
                        textAlign: TextAlign.center),
                    Text('${details[index].countitems}',
                        textAlign: TextAlign.center),
                    Text('${details[index].itemPrice}',
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.center),
                  ])),
        ],
      ),
    );
  }
}
