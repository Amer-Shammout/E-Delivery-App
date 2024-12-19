import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_expansion_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_switch.dart';
import 'package:e_delivery_app/Core/widgets/tile_template.dart';
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
      physics: const BouncingScrollPhysics(),
      children: [
        TileTemplate(
          tile: CustomSettingsExpansionTile(
            caller: 'theme',
            settingItem: kSettingItems[0],
            titles: kAppearanceModes,
          ),
        ),
        TileTemplate(
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
        TileTemplate(
          tile: CustomSettingsExpansionTile(
            caller: 'language',
            settingItem: kSettingItems[2],
            titles: kLanguages,
          ),
        ),
        TileTemplate(
          tile: CustomSettingTile(
            onTap: () {},
            settingItem: kSettingItems[3],
            trailing: SvgPicture.asset(
              Assets.iconsButtonsArrow,
              width: 12,
              height: 12,
              colorFilter: const ColorFilter.mode(
                kBlackColor,
                BlendMode.srcATop,
              ),
            ),
          ),
        ),
        TileTemplate(
          tile: CustomSettingTile(
            onTap: () {},
            settingItem: kSettingItems[4],
            trailing: SvgPicture.asset(
              Assets.iconsButtonsArrow,
              width: 12,
              height: 12,
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
