import 'package:e_delivery_app/Core/widgets/App%20Bar/status_app_bar.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_expansion_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/setting_item_template.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: kSpacing * 8,
        ),
        const StatusAppBar(),
        const SizedBox(
          height: kSpacing * 8,
        ),
        SettingItemTemplate(
          tile: CustomSettingsExpansionTile(
            settingItem: kSettingItems[0],
            titles: kAppearanceModes,
          ),
        ),
        SettingItemTemplate(
          tile: CustomSettingsExpansionTile(
            settingItem: kSettingItems[2],
            titles: kLanguages,
          ),
        ),
        SettingItemTemplate(
          tile: ListTile(),
        ),
      ],
    );
  }
}
