import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle fontsRegular10(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 10),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fontsRegular12(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 12),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fontsRegular14(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 14),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fontsRegular16(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 16),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fontsRegular8(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 8),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fontsRegular20(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 20),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fontsRegular24(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 24),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle fontsMedium16(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: getResponsiveFontSize(context, baseFontSize: 16),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle fontsMedium32(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: getResponsiveFontSize(context, baseFontSize: 32),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle fontsMedium10(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: getResponsiveFontSize(context, baseFontSize: 10),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle fontsMedium12(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: getResponsiveFontSize(context, baseFontSize: 12),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle fontsMedium8(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: getResponsiveFontSize(context, baseFontSize: 8),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle fontsMedium14(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: getResponsiveFontSize(context, baseFontSize: 14),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle fontsMedium28(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: getResponsiveFontSize(context, baseFontSize: 28),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle fontsBold14(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 14),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsBold20(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 20),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsBold28(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 28),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsBold16(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 16),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsBold10(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 10),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsBold24(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 24),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsBold12(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 12),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsBold18(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 18),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle fontsBlack20(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: getResponsiveFontSize(context, baseFontSize: 20),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle fontsBlack22(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: getResponsiveFontSize(context, baseFontSize: 22),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle fontsBlack24(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: getResponsiveFontSize(context, baseFontSize: 24),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle fontsBlack28(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: getResponsiveFontSize(context, baseFontSize: 28),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle fontsBlack40(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: getResponsiveFontSize(context, baseFontSize: 40),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle fontsBlack48(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.error,
      fontSize: getResponsiveFontSize(context, baseFontSize: 48),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle fontsSemiBold14(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 14),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle fontsSemiBold10(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 14),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle fontsSemiBold12(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 12),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle fontsSemiBold20(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 20),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle fontsSemiBold18(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 18),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle fontsSemiBold16(context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, baseFontSize: 16),
      fontFamily: kMontserrat,
      fontWeight: FontWeight.w600,
    );
  }
}

double getResponsiveFontSize(
  BuildContext context, {
  required baseFontSize,
}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = scaleFactor * baseFontSize;
  double lowerLimit = baseFontSize * .8;
  double upperLimit = baseFontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  // PlatformDispatcher dispatcher = PlatformDispatcher.instance;
  // double phisicalWidth = dispatcher.views.first.physicalSize.width;
  // double devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double screenWidth = phisicalWidth / devicePixelRatio;

  double screenWidth = MediaQuery.sizeOf(context).width;
  // if (screenWidth < SizeConfig.tablet) {
  //   return screenWidth / 550;
  // } else if (screenWidth < SizeConfig.desktop) {
  //   return screenWidth / 1000;
  // } else {
  return screenWidth / 1920;
  // }
}
