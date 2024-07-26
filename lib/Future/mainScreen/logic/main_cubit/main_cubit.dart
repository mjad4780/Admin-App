import 'package:untitled/Future/Drawer/CategoryScreen/logic/cubit/categories_cubit.dart';
import 'package:untitled/core/get_it/get_it.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Drawer/BrandScreen/ui/BrandScreen.dart';
import '../../../Drawer/CategoryScreen/CategoryScreen.dart';
import '../../../Drawer/CouponCodeScreen/coupon_code_screen.dart';
import '../../../Drawer/DashboardScreen/DashboardScreen.dart';
import '../../../Drawer/NotificationScreen/NotificationScreen.dart';
import '../../../Drawer/OrderScreen/OrderScreen.dart';
import '../../../Drawer/PosterScreen/PosterScreen.dart';
import '../../../Drawer/SubCategoryScreen/ui/SubCategoryScreen.dart';
import '../../../Drawer/VariantsScreen/ui/screem/VariantsScreen.dart';
import '../../../Drawer/VariantsTypeScreen/ui/screen/VariantsTypeScreen.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
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
        selectedScreen = CouponCodeScreen();
        break;
      case 'Poster':
        selectedScreen = PosterScreen();
        break;
      case 'Order':
        selectedScreen = OrderScreen();
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
