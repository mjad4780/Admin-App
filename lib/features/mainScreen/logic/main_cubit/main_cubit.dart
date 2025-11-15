import 'package:untitled/features/drawer/CategoryScreen/logic/cubit/categories_cubit.dart';

import 'package:untitled/features/drawer/OrderScreen/logic/cubit/orders_cubit.dart';
import 'package:untitled/features/drawer/PosterScreen/logic/cubit/cubit/posters_cubit.dart';
import 'package:untitled/core/get_it/get_it.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../drawer/BrandScreen/ui/BrandScreen.dart';
import '../../../drawer/CategoryScreen/CategoryScreen.dart';
import '../../../drawer/CouponCodeScreen/coupon_code_screen.dart';
import '../../../drawer/DashboardScreen/DashboardScreen.dart';
import '../../../drawer/NotificationScreen/NotificationScreen.dart';
import '../../../drawer/OrderScreen/OrderScreen.dart';
import '../../../drawer/PosterScreen/PosterScreen.dart';
import '../../../drawer/SubCategoryScreen/ui/SubCategoryScreen.dart';
import '../../../drawer/VariantsScreen/ui/screem/VariantsScreen.dart';
import '../../../drawer/VariantsTypeScreen/ui/screen/VariantsTypeScreen.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  Widget selectedScreen = const DashboardScreen();

  navigateToScreen(String screenName) {
    switch (screenName) {
      case 'Dashboard':
        selectedScreen = const DashboardScreen();
        break; // Break statement needed here
      case 'Category':
        selectedScreen = BlocProvider(
          create: (context) => getIt<CategoriesCubit>()..viewCategories(),
          child: const CategoryScreen(),
        );
        break;
      case 'SubCategory':
        selectedScreen = const SubCategoryScreen();
        break;
      case 'Brands':
        selectedScreen = const BrandScreen();
        break;
      case 'VariantType':
        selectedScreen = const VariantsTypeScreen();
        break;
      case 'Variants':
        selectedScreen = const VariantsScreen();
        break;
      case 'Coupon':
        selectedScreen = const CouponCodeScreen();
        break;
      case 'Poster':
        selectedScreen = BlocProvider(
          create: (context) => getIt<PostersCubit>()..viewPoster(),
          child: const PosterScreen(),
        );
        break;
      case 'Order':
        selectedScreen = BlocProvider(
          create: (context) => getIt<OrdersCubit>()..viewAllOrders(),
          child: const OrderScreen(),
        );
        break;
      case 'Notifications':
        selectedScreen = NotificationScreen();
        break;
      default:
        selectedScreen = const DashboardScreen();
    }
    emit(Navigator());
  }
}
