import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

myCustomtransitionPage(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 1000),
    reverseTransitionDuration: const Duration(milliseconds: 950),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child2) {
      return FadeTransition(
          opacity: CurveTween(
            curve: Curves.easeIn,
          ).animate(animation),
          child: child2);
    },
  );
}
