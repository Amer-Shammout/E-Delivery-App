import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProductCartPrice extends StatelessWidget {
  const ProductCartPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '57,55',
          style: AppStyles.fontsRegular14(context).copyWith(
              height: 0,
              decoration: TextDecoration.lineThrough,
              decorationColor: Theme.of(context).colorScheme.tertiary,
              decorationThickness: 2,
              color: Theme.of(context).colorScheme.tertiary),
        ),
        Row(
          children: [
            Text(
              '57,5',
              style: AppStyles.fontsBlack24(context)
                  .copyWith(color: Theme.of(context).colorScheme.tertiary, height: 0),
            ),
            const SizedBox(
              width: kSpacing,
            ),
            Text(
              'S.P',
              style: AppStyles.fontsRegular10(context).copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
