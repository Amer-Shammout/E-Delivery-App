import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon_button.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProductQuntity extends StatelessWidget {
  const ProductQuntity({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomIconButton(
          icon: Assets.iconsPlus,
          color: kTeranyColor,
        ),
        const SizedBox(
          width: kSpacing * 4,
        ),
        Text(
          '1',
          style: FontStyles.fontsBold16(context).copyWith(
            color: kTeranyColor,
          ),
        ),
        const SizedBox(
          width: kSpacing * 4,
        ),
        const CustomIconButton(
          icon: Assets.iconsMinus,
          color: kTeranyColor,
        ),
      ],
    );
  }
}
