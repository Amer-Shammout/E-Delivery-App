import 'package:e_delivery_app/Core/utils/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.klightPrimaryColor,
      secondary: AppColors.klightSecondaryColor,
      tertiary: AppColors.klightTeranyColor,
      surface: AppColors.klightWhiteColor,
      error: AppColors.klightBlackColor,
      outline: AppColors.klightDeliveredColor,
      scrim: AppColors.klightPreparingColor,
      shadow: AppColors.klightOnTheWayColor,
    )
  );
 
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: AppColors.kdarkPrimaryColor,
      secondary: AppColors.kdarkSecondaryColor,
      tertiary: AppColors.kdarkTeranyColor,
      surface: AppColors.kdarkWhiteColor,
      error: AppColors.kdarkBlackColor,
      outline: AppColors.kdarkDeliveredColor,
      scrim: AppColors.kdarkPreparingColor,
      shadow: AppColors.kdarkOnTheWayColor,
    )
  );
 

  
}