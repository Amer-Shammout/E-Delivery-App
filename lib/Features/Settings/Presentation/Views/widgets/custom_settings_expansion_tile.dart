import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
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
  });

  final SettingsModel settingItem;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      showTrailingIcon: true,
      trailing: SvgPicture.asset(
        Assets.iconsDropDownArrow,
        width: 16,
        height: 16,
        colorFilter: const ColorFilter.mode(
          kBlackColor,
          BlendMode.srcATop,
        ),
      ),
      iconColor: kBlackColor,
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
      collapsedBackgroundColor: kWhiteColor,
      backgroundColor: kWhiteColor,
      title: Text(
        settingItem.title,
        style: FontStyles.fontsMedium16(context).copyWith(
          color: kBlackColor,
        ),
      ),
      leading: SvgPicture.asset(
        settingItem.icon,
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(
          kBlackColor,
          BlendMode.srcATop,
        ),
      ),
      children: [
        CustomRadioButtonGroup(
          titles: titles,
        ),
      ],
    );
  }
}
