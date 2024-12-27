import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Features/Settings/Data/models/settings_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSettingTile extends StatelessWidget {
  const CustomSettingTile(
      {super.key,
      required this.settingItem,
      required this.trailing,
      required this.onTap});

  final SettingsModel settingItem;
  final Widget trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: kSpacing * 4),
      title: Text(
        settingItem.title,
        style: AppStyles.fontsMedium16(context).copyWith(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
      leading: SvgPicture.asset(
        settingItem.icon,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.error,
          BlendMode.srcATop,
        ),
      ),
      trailing: trailing,
    );
  }
}
