import 'package:e_delivery_app/Core/widgets/tile_template.dart';
import 'package:e_delivery_app/Features/Settings/Data/models/settings_model.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Manager/localization_cubit/localization_cubit.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/functions/settings_function.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationTile extends StatelessWidget {
  const LocalizationTile({
    super.key,
    required this.settingsModel,
    required this.languages,
  });

  final SettingsModel settingsModel;
  final List<String> languages;

  @override
  Widget build(BuildContext context) {
    return TileTemplate(
      tile: BlocBuilder<LocalizationCubit, String>(
        builder: (context, lang) {
          return CustomSettingsExpansionTile(
            onChanged: (value) =>
                SettingsFunction.changeLanguage(value, context),
            groupValue: SettingsFunction.setLanguagesGroupValue(lang, context),
            settingItem: settingsModel,
            titles: languages,
          );
        },
      ),
    );
  }
}
