import 'package:e_delivery_app/Core/utils/styles/app_colors.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:feedback/feedback.dart';
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
      surfaceTint: AppColors.klightSecondaryColor,
    ),
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
      surfaceTint: Colors.grey,
    ),
  );

  static FeedbackThemeData lightFeedbackThemeData() => FeedbackThemeData(
        bottomSheetTextInputStyle: const TextStyle(
          color: Color(0xFF302F34),
          fontSize: 16,
          fontFamily: kMontserrat,
          fontWeight: FontWeight.w500,
        ),
        background: AppTheme.lightTheme.colorScheme.secondary,
        feedbackSheetColor: AppTheme.lightTheme.colorScheme.surface,
        bottomSheetDescriptionStyle: const TextStyle(
          color: Color(0xFF302F34),
          fontSize: 16,
          fontFamily: kMontserrat,
          fontWeight: FontWeight.w500,
        ),
        dragHandleColor: Colors.grey.shade400,
      );

  static FeedbackThemeData darkFeedbackThemeData() => FeedbackThemeData(
        bottomSheetTextInputStyle: const TextStyle(
          color: Color(0xFFC4C4C4),
          fontSize: 16,
          fontFamily: kMontserrat,
          fontWeight: FontWeight.w500,
        ),
        background: AppTheme.darkTheme.colorScheme.secondary,
        feedbackSheetColor: AppTheme.darkTheme.colorScheme.surface,
        bottomSheetDescriptionStyle: const TextStyle(
          color: Color(0xFFC4C4C4),
          fontSize: 16,
          fontFamily: kMontserrat,
          fontWeight: FontWeight.w500,
        ),
        dragHandleColor: AppTheme.darkTheme.colorScheme.error,
      );
}
