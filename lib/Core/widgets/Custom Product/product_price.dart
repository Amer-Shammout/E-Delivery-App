import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_text_button.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '57,55',
              style: FontStyles.fontsBlack20(context)
                  .copyWith(color: kTeranyColor),
            ),
            const SizedBox(
              width: kSpacing,
            ),
            Text(
              'S.P',
              style: FontStyles.fontsRegular10(context)
                  .copyWith(color: kTeranyColor),
            ),
          ],
        ),
        CustomTextButtonWithIcon(
          onPressed: () {},
          title: 'Add',
          style: FontStyles.fontsMedium12(context),
          color: kTeranyColor,
          size: 16,
          icon: Assets.iconsPlus,
        ),
      ],
    );
  }
}
