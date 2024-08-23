import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop help us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1200 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If our width is more than 1200 then we consider it a desktop
    if (size.width >= 1200) {
      return desktop(context);
    }
    // If width it less then 1200 and more then 850 we consider it as tablet
    else if (size.width >= 850 && tablet != null) {
      return tablet!(context);
    }
    // Or less then that we called it mobile
    else {
      return mobile(context);
    }
  }
}
