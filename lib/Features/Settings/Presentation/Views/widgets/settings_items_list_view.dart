import 'dart:io';

import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Manager/theme_cubit/theme_cubit.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_expansion_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_tile.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_switch.dart';
import 'package:e_delivery_app/Core/widgets/tile_template.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';

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
                onChanged: changeThemeMode,
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
                  final screenshotFilePath =
                      await writeImageToStorage (feedback.screenshot);

                  final Email email = Email(
                    body: feedback.text,
                    subject: 'App Feedback',
                    recipients: ['amershammout2004@gmail.com'],
                    attachmentPaths: [screenshotFilePath],
                    isHTML: false,
                  );

                  await FlutterEmailSender.send(email);
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

  changeThemeMode(value) {
    switch (value) {
      case 'light':
        BlocProvider.of<ThemeCubit>(context).updateTheme(ThemeMode.light);
        break;
      case 'dark':
        BlocProvider.of<ThemeCubit>(context).updateTheme(ThemeMode.dark);
        break;
      case 'system':
        BlocProvider.of<ThemeCubit>(context).updateTheme(ThemeMode.system);

        break;
    }
  }

  Future<String> writeImageToStorage(Uint8List feedbackScreenshot) async {
  final Directory output = await getTemporaryDirectory();
  final String screenshotFilePath = '${output.path}/feedback.png';
  final File screenshotFile = File(screenshotFilePath);
  await screenshotFile.writeAsBytes(feedbackScreenshot);
  return screenshotFilePath;
}
}
