import 'package:e_delivery_app/Core/services/firebase_notification.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/tile_template.dart';
import 'package:e_delivery_app/Features/Settings/Data/models/settings_model.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_settings_tile.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.settingsModel});
  final SettingsModel settingsModel;
  @override
  Widget build(BuildContext context) {
    return TileTemplate(
      tile: CustomSettingTile(
          settingItem: settingsModel,
          trailing: Text(
            setNotificationState(context),
            style: AppStyles.fontsRegular16(context).copyWith(
                color: Theme.of(context).colorScheme.error.withOpacity(.5)),
          )),
    );
  }

  String setNotificationState(BuildContext context) {
    return FirebaseNotification.isActive ?? false
        ? S.of(context).active
        : S.of(context).inactive;
  }
}
