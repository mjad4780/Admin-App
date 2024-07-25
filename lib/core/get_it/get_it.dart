import 'package:untitled/Future/Drawer/CategoryScreen/logic/cubit/categories_cubit.dart';
import 'package:untitled/Future/Drawer/CouponCodeScreen/logic/cubit/coupon_cubit.dart';
import 'package:untitled/Future/Drawer/DashboardScreen/data/repo.dart';
import 'package:untitled/Future/Drawer/DashboardScreen/logic/cubit/dashboard_cubit.dart';
import 'package:untitled/Future/Drawer/DashboardScreen/logic/cubit_d/dashboard_cubit.dart';

import 'package:untitled/Future/Drawer/OrderScreen/logic/cubit/orders_cubit.dart';
import 'package:untitled/Future/Drawer/PosterScreen/data/repo.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:untitled/Future/mainScreen/logic/main_cubit/main_cubit.dart';

import '../../Future/Drawer/CategoryScreen/data/repo.dart';
import '../../Future/Drawer/CouponCodeScreen/data/repo.dart';
import '../../Future/Drawer/OrderScreen/data/repo_orders.dart';
import '../../Future/Drawer/OrderScreen/data/repo_view_order.dart';
import '../../Future/Drawer/PosterScreen/logic/cubit/cubit/posters_cubit.dart';
import '../class/cache_helper.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;
void setupServise() {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerSingleton<CacheHelper>(CacheHelper());

  // Categories
  getIt.registerLazySingleton<CategoriesRepo>(() => CategoriesRepo(getIt()));
  getIt.registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()));

  // Items
  getIt.registerLazySingleton<ItemsRepo>(() => ItemsRepo(getIt()));
  getIt.registerFactory<DashboardCubit>(() => DashboardCubit(getIt()));
  getIt.registerFactory<DashboardsCubit>(() => DashboardsCubit());

  // Coupon
  getIt.registerLazySingleton<CouponRepo>(() => CouponRepo(getIt()));
  getIt.registerFactory<CouponCubit>(() => CouponCubit(getIt()));
  // Orders
  getIt.registerLazySingleton<ViewOrdersRepo>(() => ViewOrdersRepo(getIt()));
  getIt.registerLazySingleton<OrdersRepo>(() => OrdersRepo(getIt()));
  getIt.registerFactory<OrdersCubit>(() => OrdersCubit(getIt(), getIt()));
  // Poster
  getIt.registerLazySingleton<PosterRepo>(() => PosterRepo(getIt()));
  getIt.registerFactory<PostersCubit>(() => PostersCubit(getIt()));
  getIt.registerFactory<MainCubit>(() => MainCubit());
}
