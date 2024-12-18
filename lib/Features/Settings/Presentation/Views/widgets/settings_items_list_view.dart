import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_expansion_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_switch.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/setting_item_template.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsItemsListView extends StatefulWidget {
  const SettingsItemsListView({
    super.key,
  });


  @override
  State<SettingsItemsListView> createState() => _SettingsItemsListViewState();
}

class _SettingsItemsListViewState extends State<SettingsItemsListView> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SettingItemTemplate(
          tile: CustomSettingsExpansionTile(
            settingItem: kSettingItems[0],
            titles: kAppearanceModes,
          ),
        ),
        SettingItemTemplate(
          tile: CustomSettingTile(
            onTap: () {},
            settingItem: kSettingItems[1],
            trailing: CustomSwitch(
              isSwitched: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ),
        ),
        SettingItemTemplate(
          tile: CustomSettingsExpansionTile(
            settingItem: kSettingItems[2],
            titles: kLanguages,
          ),
        ),
        SettingItemTemplate(
          tile: CustomSettingTile(
            onTap: () {},
            settingItem: kSettingItems[3],
            trailing: SvgPicture.asset(
              Assets.iconsButtonsArrow,
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                kBlackColor,
                BlendMode.srcATop,
              ),
            ),
          ),
        ),
        SettingItemTemplate(
          tile: CustomSettingTile(
            onTap: () {},
            settingItem: kSettingItems[4],
            trailing: SvgPicture.asset(
              Assets.iconsButtonsArrow,
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                kBlackColor,
                BlendMode.srcATop,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: kSpacing * 8,
        ),
      ],
    );
  }
}
