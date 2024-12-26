import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Features/Settings/Data/models/settings_model.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

const double kSpacing = 4;
const Color kPrimaryColor = Color(0xFF526077);
const Color kSecondaryColor = Color(0xFFF6F7F9);
const Color kTeranyColor = Color(0xFFF65C51);
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kBlackColor = Color(0xFF302F34);
const Color kPreparingColor = Color(0xFFCEEBFF);
const Color kDeliveredColor = Color(0xFFD2FFB7);
const Color kOnTheWayColor = Color(0xFF526077);
const kMontserrat = 'Montserrat';
const double kHorizontalPadding = 16;
const kAppearanceModes = [
  'light',
  'dark',
  'system',
];
const kLanguages = [
  'English',
  'العربيّة',
];

var kSettingItems = [
  SettingsModel(
    icon: Assets.iconsTheme,
    title: S.current.setting1,
  ),
  SettingsModel(
    icon: Assets.iconsNotification,
    title: S.current.setting2,
  ),
  SettingsModel(
    icon: Assets.iconsLanguage,
    title: S.current.setting3,
  ),
  SettingsModel(
    icon: Assets.iconsAbout,
    title: S.current.setting4,
  ),
  SettingsModel(
    icon: Assets.iconsFeedback,
    title: S.current.setting5,
  ),
];
