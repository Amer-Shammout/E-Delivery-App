import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_check_box.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class CustomRadioButtonListTile extends StatelessWidget {
  final String title;
  final String groupValue;
  final String value;
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
          style: FontStyles.fontsRegular16(context)
              .copyWith(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }

  Widget _customRadioButton(context) {
    bool isSelected = value == groupValue;

    return CustomCheckBox(value: isSelected);
  }
}
