import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension Navigation on BuildContext {
  // Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
  //   return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  // }

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
