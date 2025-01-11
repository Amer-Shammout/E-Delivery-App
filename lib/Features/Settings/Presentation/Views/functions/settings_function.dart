import 'dart:io';

import 'package:e_delivery_app/Core/Data/Manager/get_user_cubit/get_user_cubit.dart';
import 'package:e_delivery_app/Core/utils/functions/localizations_funs.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Manager/localization_cubit/localization_cubit.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Manager/theme_cubit/theme_cubit.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:path_provider/path_provider.dart';

abstract class SettingsFunction {
  static changeThemeMode(value, context) {
    switch (value) {
      case 'Light' || 'فاتح':
        BlocProvider.of<ThemeCubit>(context).updateTheme(ThemeMode.light);
        break;
      case 'Dark' || 'داكن':
        BlocProvider.of<ThemeCubit>(context).updateTheme(ThemeMode.dark);
        break;
      case 'System' || 'النّظام':
        BlocProvider.of<ThemeCubit>(context).updateTheme(ThemeMode.system);
        break;
    }
  }

  static String setThemesGroupValue(String modeName, context) {
    if (LocalizationsFuns.isArabic(context)) {
      switch (modeName) {
        case 'light':
          return 'فاتح';
        case 'dark':
          return 'داكن';
        default:
          return 'النّظام';
      }
    } else {
      return "${modeName.substring(0, 1).toUpperCase()}${modeName.substring(1)}";
    }
  }

  static changeLanguage(value, context) {
    switch (value) {
      case 'العربيّة':
        BlocProvider.of<LocalizationCubit>(context).updateLanguage('العربيّة');
        BlocProvider.of<GetUserCubit>(context).getUser(data: {'lang': 'ar'});
        break;
      case 'English':
        BlocProvider.of<LocalizationCubit>(context).updateLanguage('English');
        BlocProvider.of<GetUserCubit>(context).getUser(data: {'lang': 'en'});
        break;
      case "System" || "النّظام":
        BlocProvider.of<LocalizationCubit>(context).updateLanguage('System');
        BlocProvider.of<GetUserCubit>(context).getUser(
            data: {'lang': Localizations.localeOf(context).languageCode});

        break;
    }
  }

  static String setLanguagesGroupValue(String lang, context) {
    if (lang == "System") {
      if (LocalizationsFuns.isArabic(context)) {
        return 'النّظام';
      } else {
        return 'System';
      }
    } else {
      return lang;
    }
  }

  static Future<String> writeImageToStorage(
      Uint8List feedbackScreenshot) async {
    final Directory output = await getTemporaryDirectory();
    final String screenshotFilePath = '${output.path}/feedback.png';
    final File screenshotFile = File(screenshotFilePath);
    await screenshotFile.writeAsBytes(feedbackScreenshot);
    return screenshotFilePath;
  }

  static Future<void> sendEmail(UserFeedback feedback) async {
    final screenshotFilePath =
        await SettingsFunction.writeImageToStorage(feedback.screenshot);

    final Email email = Email(
      body: feedback.text,
      subject: 'App Feedback',
      recipients: ['amershammout2004@gmail.com'],
      attachmentPaths: [screenshotFilePath],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }
}
