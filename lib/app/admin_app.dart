import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../core/constans/Color.dart';
import '/core/Navigator/Navigator.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColor.bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: AppColor.secondaryColor,
      ),
    );
  }
}
