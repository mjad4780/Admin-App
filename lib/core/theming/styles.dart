import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utility/size_config.dart';
import 'colors.dart';
import 'font_weight_helper.dart';

abstract class TextStyles {
  static TextStyle styleRegular16(context) {
    return const TextStyle(
      // color: const Color(0xFF064060),
      // fontSize: getResponsiveFontSize(context, fontSize: 16),
      // fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle stylesection(context) {
    return const TextStyle(
      color: AppColor.primaryColor, fontWeight: FontWeight.bold,
      // color: const Color(0xFF064060),
      // fontSize: getResponsiveFontSize(context, fontSize: 16),
      // fontFamily: 'Montserrat',
    );
  }

  static TextStyle itemprice(context) {
    return const TextStyle(
      color: AppColor.black, fontWeight: FontWeight.bold,
      // color: const Color(0xFF064060),
      // fontSize: getResponsiveFontSize(context, fontSize: 16),
      // fontFamily: 'Montserrat',
    );
  }

  static TextStyle adress(context) {
    return const TextStyle(
      color: Colors.blueAccent, fontWeight: FontWeight.bold,
      // color: const Color(0xFF064060),
      // fontSize: getResponsiveFontSize(context, fontSize: 18),
      // fontFamily: 'Montserrat',
    );
  }

  static TextStyle stylesectionreqler(context) {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      // color: const Color(0xFF064060),
      // fontSize: getResponsiveFontSize(context, fontSize: 16),
      // fontFamily: 'Montserrat',
    );
  }

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.darkBlue,
  );

  static TextStyle font14LightGrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColor.lightGray,
  );
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
