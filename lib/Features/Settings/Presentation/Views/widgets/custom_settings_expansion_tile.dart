import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Features/Settings/Data/models/settings_model.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_radio_buttons_group.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSettingsExpansionTile extends StatelessWidget {
  const CustomSettingsExpansionTile({
    super.key,
    required this.settingItem,
    required this.titles,
    required this.groupValue,
    required this.onChanged,
  });

  final SettingsModel settingItem;
  final List<String> titles;
  final String groupValue;
  final dynamic Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      showTrailingIcon: true,
      trailing: SvgPicture.asset(
        Assets.iconsDropDownArrow,
        width: 12,
        height: 12,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.error,
          BlendMode.srcATop,
        ),
      ),
      iconColor: Theme.of(context).colorScheme.error,
      childrenPadding: const EdgeInsets.only(
          right: kHorizontalPadding,
          left: kHorizontalPadding,
          bottom: kSpacing * 4,
          top: kSpacing),
      tilePadding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: kSpacing * 4),
      shape: Border.all(
        color: Colors.transparent,
      ),
      collapsedShape: Border.all(
        color: Colors.transparent,
      ),
      collapsedBackgroundColor: Theme.of(context).colorScheme.surface,
      backgroundColor: Theme.of(context).colorScheme.surface,
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
      children: [
        CustomRadioButtonGroup(
          onChanged: onChanged,
          groupValue: groupValue,
          titles: titles,
        ),
      ],
    );
  }
}
