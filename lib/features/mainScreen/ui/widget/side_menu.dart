import '../../logic/main_cubit/main_cubit.dart';
import '../../../../core/constans/icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import 'DrawerListTile.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: Assets.iconsMenuDashboard,
            press: () {
              context.read<MainCubit>().navigateToScreen('Dashboard');
            },
          ),
          DrawerListTile(
            title: "Category",
            svgSrc: Assets.iconsMenuTran,
            press: () {
              context.read<MainCubit>().navigateToScreen('Category');
            },
          ),
          DrawerListTile(
            title: "Sub Category",
            svgSrc: Assets.iconsMenuTask,
            press: () {
              context.read<MainCubit>().navigateToScreen('SubCategory');
            },
          ),
          DrawerListTile(
            title: "Brands",
            svgSrc: Assets.iconsProduct4,
            press: () {
              context.read<MainCubit>().navigateToScreen('Brands');
            },
          ),
          DrawerListTile(
            title: "Variant Type",
            svgSrc: Assets.iconsMenuStore,
            press: () {
              context.read<MainCubit>().navigateToScreen('VariantType');
            },
          ),
          DrawerListTile(
            title: "Variants",
            svgSrc: Assets.iconsMenuNotification,
            press: () {
              context.read<MainCubit>().navigateToScreen('Variants');
            },
          ),
          DrawerListTile(
            title: "Orders",
            svgSrc: Assets.iconsMenuProfile,
            press: () {
              context.read<MainCubit>().navigateToScreen('Order');
            },
          ),
          DrawerListTile(
            title: "Coupons",
            svgSrc: Assets.iconsMenuSetting,
            press: () {
              context.read<MainCubit>().navigateToScreen('Coupon');
            },
          ),
          DrawerListTile(
            title: "Posters",
            svgSrc: Assets.iconsMenuDoc,
            press: () {
              context.read<MainCubit>().navigateToScreen('Poster');
            },
          ),
          DrawerListTile(
            title: "Notifications",
            svgSrc: Assets.iconsMenuNotification,
            press: () {
              context.read<MainCubit>().navigateToScreen('Notifications');
            },
          ),
        ],
      ),
    );
  }
}
