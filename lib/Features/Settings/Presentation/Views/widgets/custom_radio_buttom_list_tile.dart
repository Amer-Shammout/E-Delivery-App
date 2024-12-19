import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomRadioButtonListTile extends StatelessWidget {
  final String title;
  final groupValue;
  final value;
  final Function(dynamic) onChanged;
  const CustomRadioButtonListTile(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.title,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: ListTile(
        minVerticalPadding: 0,
        titleAlignment: ListTileTitleAlignment.center,
        minTileHeight: kSpacing * 9,
        leading: _customRadioButton(context),
        title: Text(
          title,
          style:
              FontStyles.fontsRegular16(context).copyWith(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }

  Widget _customRadioButton(context) {
    bool isSelected = value == groupValue;

    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      child: Center(
        child: isSelected
            ? SvgPicture.asset(
                Assets.iconsCheck,
                width: 5.5,
                height: 5.5,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
