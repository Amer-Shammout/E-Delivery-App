 import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/set_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

LottieBuilder myAppLottieIndicator(BuildContext context) {
    return Lottie.asset(
              SetThemeColors.isDarkMode(context)
                  ? Assets.lottieLoadingDark
                  : Assets.lottieLoadingLight,
              height: 100,
              width: 100,
            );
  }