import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Features/Settings/Data/models/settings_model.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingData {
  SettingData();

  static List<SettingsModel> getSettingItems(BuildContext context) {
    var settingItems = [
      SettingsModel(
        icon: Assets.iconsTheme,
        title: S.of(context).setting1,
      ),
      SettingsModel(
        icon: Assets.iconsNotification,
        title: S.of(context).setting2,
      ),
      SettingsModel(
        icon: Assets.iconsLanguage,
        title: S.of(context).setting3,
      ),
      SettingsModel(
        icon: Assets.iconsAbout,
        title: S.of(context).setting4,
      ),
      SettingsModel(
        icon: Assets.iconsFeedback,
        title: S.of(context).setting5,
      ),
    ];
    return settingItems;
  }

  static List<String> getAppearanceModes(BuildContext context) {
    var appearanceModes = [
      S.of(context).setting1_details1,
      S.of(context).setting1_details2,
      S.of(context).setting1_details3,
    ];
    return appearanceModes;
  }

  static List<String> getLanguages(BuildContext context) {
    var languages = [
      S.of(context).setting1_details1,
      'English',
      'العربيّة',
    ];
    return languages;
  }
}
