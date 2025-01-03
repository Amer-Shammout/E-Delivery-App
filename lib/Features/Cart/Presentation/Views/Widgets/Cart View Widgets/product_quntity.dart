import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon_button.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProductQuntity extends StatelessWidget {
  const ProductQuntity({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
            icon: Assets.iconsPlus,
            color: Theme.of(context).colorScheme.tertiary),
        const SizedBox(
          width: kSpacing * 4,
        ),
        Text(
          '1',
          style: AppStyles.fontsBold16(context).copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        const SizedBox(
          width: kSpacing * 4,
        ),
        CustomIconButton(
            icon: Assets.iconsMinus,
            color: Theme.of(context).colorScheme.tertiary),
      ],
    );
  }
}
