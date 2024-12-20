import 'package:e_delivery_app/Features/Settings/Presentation/Manager/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SetThemeColors {
  static Color setBackgroundColor(context) {
    ThemeMode themeMode = BlocProvider.of<ThemeCubit>(context).state;
    switch (themeMode) {
      case ThemeMode.light:
        return Theme.of(context).colorScheme.surface;
      case ThemeMode.dark:
        return Theme.of(context).colorScheme.secondary;
      case ThemeMode.system:
        if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
          return Theme.of(context).colorScheme.secondary;
        } else {
          return Theme.of(context).colorScheme.surface;
        }
    }
  }

  static bool isDarkMode(context) {
    if ((BlocProvider.of<ThemeCubit>(context).state == ThemeMode.system && MediaQuery.of(context).platformBrightness == Brightness.dark) || BlocProvider.of<ThemeCubit>(context).state == ThemeMode.dark) {
      return true;
    }
    return false;
  }
}
