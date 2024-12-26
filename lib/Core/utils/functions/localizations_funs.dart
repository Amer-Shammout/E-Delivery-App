import 'package:e_delivery_app/Features/Settings/Presentation/Manager/localization_cubit/localization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LocalizationsFuns {
  static bool isArabic(context) =>
      BlocProvider.of<LocalizationCubit>(context).state == 'العربيّة' ||
      Localizations.localeOf(context).languageCode == 'ar';
}
