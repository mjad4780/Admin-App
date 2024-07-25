import '../../../Drawer/CategoryScreen/logic/CategoryScreen_cubit/category_cubit.dart';
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
  Widget selectedScreen = DashboardScreen();

  navigateToScreen(String screenName) {
    switch (screenName) {
      case 'Dashboard':
        selectedScreen = DashboardScreen();
        break; // Break statement needed here
      case 'Category':
        selectedScreen = BlocProvider(
          create: (context) => CategoryCubit(),
          child: CategoryScreen(),
        );
        break;
      case 'SubCategory':
        selectedScreen = SubCategoryScreen();
        break;
      case 'Brands':
        selectedScreen = BrandScreen();
        break;
      case 'VariantType':
        selectedScreen = VariantsTypeScreen();
        break;
      case 'Variants':
        selectedScreen = VariantsScreen();
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
        selectedScreen = DashboardScreen();
    }
    emit(Navigator());
  }
}
