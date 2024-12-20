import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class FavoriteProductContent extends StatelessWidget {
  const FavoriteProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EMMATEL',
          style: FontStyles.fontsMedium10(context).copyWith(
            fontSize: 8,
            color: Theme.of(context).colorScheme.error.withOpacity(0.35),
          ),
        ),
        Text(
          'IPHONE 16 PRO MAX',
          style: FontStyles.fontsBold14(context).copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        CustomWidgetWithDash(
          dashColor: Theme.of(context).colorScheme.primary,
          width: 20,
          height: 2,
          widget: Text(
            'Mobiles',
            style: FontStyles.fontsSemiBold12(context).copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(
          height: kSpacing * 6,
        ),
        Text(
          '57,55',
          style: FontStyles.fontsRegular10(context).copyWith(
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
              style: FontStyles.fontsBlack20(context)
                  .copyWith(color: Theme.of(context).colorScheme.tertiary, height: 0),
            ),
            const SizedBox(
              width: kSpacing,
            ),
            Text(
              'S.P',
              style: FontStyles.fontsRegular10(context).copyWith(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
