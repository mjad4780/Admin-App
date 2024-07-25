import '../logic/cubit_d/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/product_summery_info.dart';
import '../../../../utility/constants.dart';

List<ProductSummeryInfo> ListCardSummeryInfo(BuildContext context) {
  List<ProductSummeryInfo> productSummeryItems = [
    ProductSummeryInfo(
      title: "All Product",
      productsCount: context.read<DashboardsCubit>().totalProduct,
      svgSrc: "assets/icons/Product.svg",
      color: primaryColor,
      percentage: 100,
    ),
    ProductSummeryInfo(
      title: "Out of Stock",
      productsCount: context.read<DashboardsCubit>().outOfStockProduct,
      svgSrc: "assets/icons/Product2.svg",
      color: Color(0xFFEA3829),
      percentage: context.read<DashboardsCubit>().totalProduct != 0
          ? (context.read<DashboardsCubit>().outOfStockProduct /
                  context.read<DashboardsCubit>().totalProduct) *
              100
          : 0,
    ),
    ProductSummeryInfo(
      title: "Limited Stock",
      productsCount: context.read<DashboardsCubit>().limitedStockProduct,
      svgSrc: "assets/icons/Product3.svg",
      color: Color(0xFFECBE23),
      percentage: context.read<DashboardsCubit>().totalProduct != 0
          ? (context.read<DashboardsCubit>().limitedStockProduct /
                  context.read<DashboardsCubit>().totalProduct) *
              100
          : 0,
    ),
    ProductSummeryInfo(
      title: "Other Stock",
      productsCount: context.read<DashboardsCubit>().otherStockProduct,
      svgSrc: "assets/icons/Product4.svg",
      color: Color(0xFF47e228),
      percentage: context.read<DashboardsCubit>().totalProduct != 0
          ? (context.read<DashboardsCubit>().otherStockProduct /
                  context.read<DashboardsCubit>().totalProduct) *
              100
          : 0,
    ),
  ];
  return productSummeryItems;
}
