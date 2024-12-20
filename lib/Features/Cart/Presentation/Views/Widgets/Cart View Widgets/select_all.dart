import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_cart_check_box.dart';
import 'package:flutter/material.dart';

class SelectAll extends StatelessWidget {
  const SelectAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCartCheckBox(),
        const SizedBox(
          width: 2,
        ),
        Text(
          'Select All',
          style: FontStyles.fontsMedium14(context)
              .copyWith(color: Theme.of(context).colorScheme.primary),
        )
      ],
    );
  }
}
