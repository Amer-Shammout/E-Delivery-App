import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/localizations_funs.dart';
import 'package:e_delivery_app/Core/widgets/tile_template.dart';
import 'package:e_delivery_app/Features/Settings/Data/models/settings_model.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/functions/settings_function.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_tile.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeedbackTile extends StatelessWidget {
  const FeedbackTile({
    super.key,
    required this.settingsModel,
  });

  final SettingsModel settingsModel;

  @override
  Widget build(BuildContext context) {
    return TileTemplate(
      tile: CustomSettingTile(
        onTap: () {
          BetterFeedback.of(context).show(
            (UserFeedback feedback) async {
              await SettingsFunction.sendEmail(feedback);
            },
          );
        },
        settingItem: settingsModel,
        trailing: RotatedBox(
          quarterTurns: LocalizationsFuns.isArabic(context) ? 2 : 0,
          child: SvgPicture.asset(
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
    );
  }
}
