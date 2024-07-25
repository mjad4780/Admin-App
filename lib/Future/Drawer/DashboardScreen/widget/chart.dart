import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/constants.dart';
import '../logic/cubit_d/dashboard_cubit.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

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
              sections: _buildPieChartSelectionData(context),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Text(
                  '${context.read<DashboardsCubit>().totalOrder}', //TODO: should complete Make this order number dynamic bt calling calculateOrdersWithStatus
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                SizedBox(height: defaultPadding),
                Text("Order")
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSelectionData(BuildContext context) {
    List<PieChartSectionData> pieChartSelectionData = [
      PieChartSectionData(
        color: Color(0xFFFFCF26),
        value: context.read<DashboardsCubit>().pendingOrder.toDouble(),
        showTitle: false,
        radius: 20,
      ),
      PieChartSectionData(
        color: Color(0xFFEE2727),
        value: context.read<DashboardsCubit>().cancelledOrder.toDouble(),
        showTitle: false,
        radius: 20,
      ),
      PieChartSectionData(
        color: Color(0xFF2697FF),
        value: context.read<DashboardsCubit>().shippedOrder.toDouble(),
        showTitle: false,
        radius: 20,
      ),
      PieChartSectionData(
        color: Color(0xFF26FF31),
        value: context.read<DashboardsCubit>().deliveredOrder.toDouble(),
        showTitle: false,
        radius: 20,
      ),
      PieChartSectionData(
        color: Colors.white,
        value: context.read<DashboardsCubit>().processingOrder.toDouble(),
        showTitle: false,
        radius: 20,
      ),
    ];

    return pieChartSelectionData;
  }
}
