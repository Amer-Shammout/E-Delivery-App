import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIcon(
          icon: Assets.iconsBackArrow,
          onPressed: () {
            GoRouter.of(context).pop();
          },
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
        Text(
          'HOT',
          style: FontStyles.fontsBold20(context)
              .copyWith(color: Theme.of(context).colorScheme.tertiary),
        ),
        CustomIcon(
          icon: Assets.iconsOutlineHeartOutline,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
      ],
    );
  }
}
