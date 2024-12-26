import 'dart:io';

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
      case 'light':
        BlocProvider.of<ThemeCubit>(context).updateTheme(ThemeMode.light);
        break;
      case 'dark':
        BlocProvider.of<ThemeCubit>(context).updateTheme(ThemeMode.dark);
        break;
      case 'system':
        BlocProvider.of<ThemeCubit>(context).updateTheme(ThemeMode.system);
        break;
    }
  }

  static changeLanguage(value, context) {
    switch (value) {
      case 'light':
        BlocProvider.of<ThemeCubit>(context).updateTheme(ThemeMode.light);
        break;
      case 'dark':
        BlocProvider.of<ThemeCubit>(context).updateTheme(ThemeMode.dark);
        break;
      case 'system':
        BlocProvider.of<ThemeCubit>(context).updateTheme(ThemeMode.system);
        break;
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
