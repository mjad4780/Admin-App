import 'package:untitled/features/drawer/CategoryScreen/logic/cubit/categories_cubit.dart';
import 'package:untitled/features/drawer/CouponCodeScreen/logic/cubit/coupon_cubit.dart';
import 'package:untitled/features/drawer/DashboardScreen/data/repo.dart';
import 'package:untitled/features/drawer/DashboardScreen/data/repo_get_dashboard.dart';
import 'package:untitled/features/drawer/DashboardScreen/logic/cubit/dashboard_cubit.dart';
import 'package:untitled/features/drawer/NotificationScreen/data/repo.dart';
import 'package:untitled/features/drawer/NotificationScreen/logic/cubit/notification_cubit.dart';

import 'package:untitled/features/drawer/OrderScreen/logic/cubit/orders_cubit.dart';
import 'package:untitled/features/drawer/PosterScreen/data/repo.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:untitled/features/mainScreen/logic/main_cubit/main_cubit.dart';

import '../../features/drawer/CategoryScreen/data/repo.dart';
import '../../features/drawer/CouponCodeScreen/data/repo.dart';
import '../../features/drawer/OrderScreen/data/repo_orders.dart';
import '../../features/drawer/OrderScreen/data/repo_view_order.dart';
import '../../features/drawer/PosterScreen/logic/cubit/cubit/posters_cubit.dart';
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

  // Dashboard
  getIt.registerLazySingleton<ItemsRepo>(() => ItemsRepo(getIt()));
  getIt.registerLazySingleton<DashboardRepo>(() => DashboardRepo(getIt()));

  getIt.registerFactory<DashboardCubit>(() => DashboardCubit(getIt(), getIt()));
  // getIt.registerFactory<DashboardsCubit>(() => DashboardsCubit());

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

  // Notification
  getIt
      .registerLazySingleton<NotificationRepo>(() => NotificationRepo(getIt()));
  getIt.registerFactory<NotificationCubit>(() => NotificationCubit(getIt()));
}
