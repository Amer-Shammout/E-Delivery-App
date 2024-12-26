import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Features/Settings/Data/models/settings_model.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Manager/localization_cubit/localization_cubit.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Manager/theme_cubit/theme_cubit.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/functions/settings_function.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_expansion_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_switch.dart';
import 'package:e_delivery_app/Core/widgets/tile_template.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
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
    var languages = [
      S.of(context).setting1_details1,
      'English',
      'العربيّة',
    ];
    var appearanceModes = [
      S.of(context).setting1_details1,
      S.of(context).setting1_details2,
      S.of(context).setting1_details3,
    ];
    var settingItems = [
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
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        TileTemplate(
          tile: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, mode) {
              return CustomSettingsExpansionTile(
                onChanged: (value) =>
                    SettingsFunction.changeThemeMode(value, context),
                groupValue:
                    SettingsFunction.setThemesGroupValue(mode.name, context),
                settingItem: settingItems[0],
                titles: appearanceModes,
              );
            },
          ),
        ),
        TileTemplate(
          tile: CustomSettingTile(
            onTap: () {},
            settingItem: settingItems[1],
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
        BlocBuilder<LocalizationCubit, String>(
          builder: (context, lang) {
            return TileTemplate(
              tile: CustomSettingsExpansionTile(
                onChanged: (value) =>
                    SettingsFunction.changeLanguage(value, context),
                groupValue:
                    SettingsFunction.setLanguagesGroupValue(lang, context),
                settingItem: settingItems[2],
                titles: languages,
              ),
            );
          },
        ),
        TileTemplate(
          tile: CustomSettingTile(
            onTap: () {},
            settingItem: settingItems[3],
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
            settingItem: settingItems[4],
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
