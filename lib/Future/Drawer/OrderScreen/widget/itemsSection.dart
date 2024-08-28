import 'package:flutter/material.dart';
import 'package:untitled/core/theming/styles.dart';

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
          TableRow(children: [
            Text("Item",
                textAlign: TextAlign.center,
                style: TextStyles.stylesectionreqler(context)),
            Text("Count",
                textAlign: TextAlign.center,
                style: TextStyles.stylesectionreqler(context)),
            Text("Size",
                textAlign: TextAlign.center,
                style: TextStyles.stylesectionreqler(context)),
            Text("Color",
                textAlign: TextAlign.center,
                style: TextStyles.stylesectionreqler(context)),
            Text("ItemPrice",
                textAlign: TextAlign.center,
                style: TextStyles.stylesectionreqler(context)),
          ]),
          ...List.generate(
              details.length,
              (index) => TableRow(children: [
                    Text('${details[index].itemName}',
                        style: TextStyles.stylesectionreqler(context),
                        textAlign: TextAlign.center),
                    Text('${details[index].countitems}',
                        style: TextStyles.stylesectionreqler(context),
                        textAlign: TextAlign.center),
                    Text('${details[index].cartSize}',
                        style: TextStyles.stylesectionreqler(context),
                        textAlign: TextAlign.center),
                    Text('${details[index].cartColor}',
                        style: TextStyles.stylesectionreqler(context),
                        textAlign: TextAlign.center),
                    Text('${details[index].itemPrice}',
                        style: TextStyles.itemprice(context),
                        textAlign: TextAlign.center),
                  ])),
        ],
      ),
    );
  }
}
