import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../models/response_dashboard/order.dart';
import '../../../../utility/constants.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.order,
  });
  final Order order;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: _buildPieChartSelectionData(context, order),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: defaultPadding),
                Text(
                  '${order.totalOrders}', //TODO: should complete Make this order number dynamic bt calling calculateOrdersWithStatus
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                const SizedBox(height: defaultPadding),
                const Text("Order")
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSelectionData(
      BuildContext context, Order order) {
    List<PieChartSectionData> pieChartSelectionData = [
      PieChartSectionData(
        color: const Color(0xFFFFCF26),
        value: double.parse(order.totalPending!),
        showTitle: false,
        radius: 20,
      ),
      PieChartSectionData(
        color: Colors.white,
        value: double.parse(order.totalApprove!),
        showTitle: false,
        radius: 20,
      ),
      PieChartSectionData(
        color: const Color(0xFF2697FF),
        value: double.parse(order.totalShipped!),
        showTitle: false,
        radius: 20,
      ),
      PieChartSectionData(
        color: const Color(0xFF26FF31),
        value: double.parse(order.totalPrepare!),
        showTitle: false,
        radius: 20,
      ),
      PieChartSectionData(
        color: Colors.white,
        value: double.parse(order.totalDone!),
        showTitle: false,
        radius: 20,
      ),
      PieChartSectionData(
        color: const Color(0xFFEE2727),
        value: double.parse(order.totalCancel!),
        showTitle: false,
        radius: 20,
      ),
    ];

    return pieChartSelectionData;
  }
}
