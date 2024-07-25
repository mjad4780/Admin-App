import '../logic/cubit_d/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/constants.dart';
import 'chart.dart';
import 'order_info_card.dart';

class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection({
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
            "Orders Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          OrderInfoCard(
            svgSrc: "assets/icons/delivery1.svg",
            title: "All Orders",
            totalOrder: context.read<DashboardsCubit>().totalOrder,
          ),
          OrderInfoCard(
            svgSrc: "assets/icons/delivery5.svg",
            title: "Pending Orders",
            totalOrder: context.read<DashboardsCubit>().pendingOrder,
          ),
          OrderInfoCard(
            svgSrc: "assets/icons/delivery6.svg",
            title: "Processed Orders",
            totalOrder: context.read<DashboardsCubit>().processingOrder,
          ),
          OrderInfoCard(
            svgSrc: "assets/icons/delivery2.svg",
            title: "Cancelled Orders",
            totalOrder: context.read<DashboardsCubit>().cancelledOrder,
          ),
          OrderInfoCard(
            svgSrc: "assets/icons/delivery4.svg",
            title: "Shipped Orders",
            totalOrder: context.read<DashboardsCubit>().shippedOrder,
          ),
          OrderInfoCard(
            svgSrc: "assets/icons/delivery3.svg",
            title: "Delivered Orders",
            totalOrder: context.read<DashboardsCubit>().deliveredOrder,
          ),
        ],
      ),
    );
  }
}
