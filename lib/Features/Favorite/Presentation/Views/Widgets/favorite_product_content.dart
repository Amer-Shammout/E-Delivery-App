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
            color: kBlackColor.withOpacity(0.35),
          ),
        ),
        Text(
          'IPHONE 16 PRO MAX',
          style: FontStyles.fontsBold14(context).copyWith(
            color: kBlackColor,
          ),
        ),
        CustomWidgetWithDash(
          dashColor: kPrimaryColor,
          width: 20,
          height: 2,
          widget: Text(
            'Mobiles',
            style: FontStyles.fontsSemiBold12(context).copyWith(
              color: kPrimaryColor,
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
              decorationColor: kTeranyColor,
              decorationThickness: 2,
              color: kTeranyColor),
        ),
        Row(
          children: [
            Text(
              '57,5',
              style: FontStyles.fontsBlack20(context)
                  .copyWith(color: kTeranyColor, height: 0),
            ),
            const SizedBox(
              width: kSpacing,
            ),
            Text(
              'S.P',
              style: FontStyles.fontsRegular10(context).copyWith(
                color: kTeranyColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
