import '../../features/mainScreen/ui/Screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const MainScreen()),

  // NotificationView
]);

void push(context, String path) {
  GoRouter.of(context).push(
    path,
  );
}

void pushpushReplacement(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

void navigaton(context, Widget path) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => path,
    ),
  );
}
