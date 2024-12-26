import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Manager/theme_cubit/theme_cubit.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/functions/settings_function.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_expansion_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_switch.dart';
import 'package:e_delivery_app/Core/widgets/tile_template.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          tile: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, mode) {
              return CustomSettingsExpansionTile(
                onChanged: (value) =>
                    SettingsFunction.changeThemeMode(value, context),
                groupValue: mode.name,
                settingItem: kSettingItems[0],
                titles: kAppearanceModes,
              );
            },
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
            onChanged: (p0) {},
            groupValue: '',
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
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.error,
                BlendMode.srcATop,
              ),
            ),
          ),
        ),
        TileTemplate(
          tile: CustomSettingTile(
            onTap: () {
              BetterFeedback.of(context).show(
                (UserFeedback feedback) async {
                  await SettingsFunction.sendEmail(feedback);
                },
              );
            },
            settingItem: kSettingItems[4],
            trailing: SvgPicture.asset(
              Assets.iconsButtonsArrow,
              width: 12,
              height: 12,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.error,
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
