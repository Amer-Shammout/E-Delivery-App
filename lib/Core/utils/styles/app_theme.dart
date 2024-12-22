import 'package:e_delivery_app/Core/utils/styles/app_colors.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
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
  ));

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
  ));

  static FeedbackThemeData lightFeedbackThemeData(BuildContext context) =>
      FeedbackThemeData(
        bottomSheetTextInputStyle: FontStyles.fontsMedium16(context)
            .copyWith(color: AppTheme.lightTheme.colorScheme.error),
        background: AppTheme.lightTheme.colorScheme.secondary,
        feedbackSheetColor: AppTheme.lightTheme.colorScheme.surface,
        bottomSheetDescriptionStyle: FontStyles.fontsMedium16(context).copyWith(
          color: AppTheme.lightTheme.colorScheme.error,
        ),
        dragHandleColor: Colors.grey.shade400,
      );

  static FeedbackThemeData darkFeedbackThemeData(BuildContext context) =>
      FeedbackThemeData(
        bottomSheetTextInputStyle: FontStyles.fontsMedium16(context)
            .copyWith(color: AppTheme.darkTheme.colorScheme.error),
        background: AppTheme.darkTheme.colorScheme.secondary,
        feedbackSheetColor: AppTheme.darkTheme.colorScheme.surface,
        bottomSheetDescriptionStyle: FontStyles.fontsMedium16(context).copyWith(
          color: AppTheme.darkTheme.colorScheme.error,
        ),
        dragHandleColor: AppTheme.darkTheme.colorScheme.error,
      );
}
