import 'package:e_delivery_app/Features/Settings/Data/Services/setting_data.dart';
import 'package:e_delivery_app/Features/Settings/Data/models/settings_model.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/about_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/appearance_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/feedback_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/localization_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/notification_tile.dart';
import 'package:e_delivery_app/constants.dart';

import 'package:flutter/material.dart';

class SettingsItemsListView extends StatelessWidget {
  const SettingsItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> languages = SettingData.getLanguages(context);
    List<String> appearanceModes = SettingData.getAppearanceModes(context);
    List<SettingsModel> settingItems = SettingData.getSettingItems(context);
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        AppearanceTile(
            settingsModel: settingItems[0], appearanceModes: appearanceModes),
        NotificationTile(settingsModel: settingItems[1]),
        LocalizationTile(settingsModel: settingItems[2], languages: languages),
        AboutTile(settingsModel: settingItems[3]),
        FeedbackTile(settingsModel: settingItems[4]),
        const SizedBox(
          height: kSpacing * 8,
        ),
      ],
    );
  }
}
