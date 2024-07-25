import '../logic/cubit_r/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../utility/constants.dart';
import 'FormRow.dart';

class ItemSection extends StatelessWidget {
  const ItemSection({
    super.key,
    required this.cubit,
    required this.totalPrice,
  });

  final OrdersCubit? cubit;
  final int totalPrice;
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
              'Items',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // Disable scrolling within ListView
            itemCount: cubit!.cartdata.length,
            itemBuilder: (context, index) {
              final item = cubit!.cartdata[index];
              return Padding(
                padding:
                    EdgeInsets.only(bottom: 4.0), // Add spacing between items
                child: Row(
                  children: [
                    Text('productName:${item.itemsName}',
                        style: TextStyle(fontSize: 16)),
                    Gap(defaultPadding),
                    Text('Count:${item.itemsCount}',
                        style: TextStyle(fontSize: 16)),
                    Gap(defaultPadding),
                    Text('\$${item.itemsPrice?.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              );
            },
          ),
          SizedBox(
              height:
                  defaultPadding), // Add some spacing before the total price
          FormRow(
            text: 'Total Price:',
            widget: Text('\$${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16, color: Colors.green)),
          ),
        ],
      ),
    );
  }
}
