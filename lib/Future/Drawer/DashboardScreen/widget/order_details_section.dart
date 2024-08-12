import '../../../../models/response_dashboard/order.dart';
import '../logic/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/constants.dart';
import 'chart.dart';
import 'order_info_card.dart';

class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection({
    super.key,
    required this.order,
  });
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      var dashpord = context.read<DashboardCubit>();

      return BlocProvider.value(
        value: dashpord,
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: const BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Orders Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: defaultPadding),
              Chart(
                order: order,
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery1.svg",
                title: "All Orders",
                totalOrder: int.parse(order.totalOrders!),
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery5.svg",
                title: "Pending Orders",
                totalOrder: int.parse(order.totalPending!),
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery6.svg",
                title: "Approve Orders",
                totalOrder: int.parse(order.totalApprove!),
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery6.svg",
                title: "Prepare Orders",
                totalOrder: int.parse(order.totalPrepare!),
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery4.svg",
                title: "Shipped Orders",
                totalOrder: int.parse(order.totalShipped!),
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery3.svg",
                title: "Done Orders",
                totalOrder: int.parse(order.totalDone!),
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery2.svg",
                title: "Cancelled Orders",
                totalOrder: int.parse(order.totalCancel!),
              ),
            ],
          ),
        ),
      );
    });
  }
}
