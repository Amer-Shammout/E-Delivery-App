import 'package:e_delivery_app/Core/widgets/tile_template.dart';
import 'package:e_delivery_app/Features/Settings/Data/models/settings_model.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Manager/theme_cubit/theme_cubit.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/functions/settings_function.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppearanceTile extends StatelessWidget {
  const AppearanceTile({
    super.key,
    required this.settingsModel,
    required this.appearanceModes,
  });

  final SettingsModel settingsModel;
  final List<String> appearanceModes;

  @override
  Widget build(BuildContext context) {
    return TileTemplate(
      tile: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return CustomSettingsExpansionTile(
            onChanged: (value) =>
                SettingsFunction.changeThemeMode(value, context),
            groupValue:
                SettingsFunction.setThemesGroupValue(mode.name, context),
            settingItem: settingsModel,
            titles: appearanceModes,
          );
        },
      ),
    );
  }
}
