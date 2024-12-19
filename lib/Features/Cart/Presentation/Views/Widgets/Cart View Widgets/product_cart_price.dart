import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
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
          style: FontStyles.fontsRegular14(context).copyWith(
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
              style: FontStyles.fontsBlack24(context)
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
        ),
      ],
    );
  }
}
