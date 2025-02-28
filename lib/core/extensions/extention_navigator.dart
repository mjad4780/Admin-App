import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushN(BuildContext context, Widget widget, int staus) {
    // context.read<OrdersCubit>().orderStatus(staus);
    return Navigator.push(
        this, MaterialPageRoute(builder: (context) => widget));
  }

  // Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
  //   return Navigator.of(this)
  //       .pushReplacementNamed(routeName, arguments: arguments);
  // }

  // Future<dynamic> pushNamedAndRemoveUntil(String routeName,
  //     {Object? arguments, required RoutePredicate predicate}) {
  //   return Navigator.of(this)
  //       .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  // }

  void pop() => Navigator.of(this).pop();

  Future<dynamic> pushpushReplacement(
    String path,
  ) {
    return GoRouter.of(this).pushReplacement(path);
  }

  Future<dynamic> push(String path, {Object? arguments}) {
    return GoRouter.of(this).push(path, extra: arguments);
  }

  Map<dynamic, dynamic> argument() {
    Map<dynamic, dynamic> argument =
        GoRouterState.of(this).extra! as Map<dynamic, dynamic>;
    return argument;
  }
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension MapExtension<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
