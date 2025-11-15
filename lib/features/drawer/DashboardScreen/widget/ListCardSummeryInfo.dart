import '../logic/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/product_summery_info.dart';
import '../../../../utility/constants.dart';

List<ProductSummeryInfo> listCardSummeryInfo(BuildContext context) {
  List<ProductSummeryInfo> productSummeryItems = [
    ProductSummeryInfo(
      title: "All Product",
      productsCount: context.read<DashboardCubit>().totalProduct,
      svgSrc: "assets/icons/Product.svg",
      color: primaryColor,
      percentage: 100,
    ),
    ProductSummeryInfo(
      title: "Out of Stock",
      productsCount: context.read<DashboardCubit>().outOfStockProduct,
      svgSrc: "assets/icons/Product2.svg",
      color: const Color(0xFFEA3829),
      percentage: context.read<DashboardCubit>().totalProduct != 0
          ? (context.read<DashboardCubit>().outOfStockProduct /
                  context.read<DashboardCubit>().totalProduct) *
              100
          : 0,
    ),
    ProductSummeryInfo(
      title: "Limited Stock",
      productsCount: context.read<DashboardCubit>().limitedStockProduct,
      svgSrc: "assets/icons/Product3.svg",
      color: const Color(0xFFECBE23),
      percentage: context.read<DashboardCubit>().totalProduct != 0
          ? (context.read<DashboardCubit>().limitedStockProduct /
                  context.read<DashboardCubit>().totalProduct) *
              100
          : 0,
    ),
    ProductSummeryInfo(
      title: "Other Stock",
      productsCount: context.read<DashboardCubit>().otherStockProduct,
      svgSrc: "assets/icons/Product4.svg",
      color: const Color(0xFF47e228),
      percentage: context.read<DashboardCubit>().totalProduct != 0
          ? (context.read<DashboardCubit>().otherStockProduct /
                  context.read<DashboardCubit>().totalProduct) *
              100
          : 0,
    ),
  ];
  return productSummeryItems;
}
