import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_title.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          height: 150,
          Assets.imagesIphoneTest,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'EMMATEL',
              style: FontStyles.fontsMedium10(context).copyWith(
                color: kBlackColor.withOpacity(0.35),
              ),
            ),
            Text(
              'IPHONE 16 PRO MAX',
              style: FontStyles.fontsBold14(context).copyWith(
                color: kBlackColor,
              ),
            ),
            const SizedBox(
              height: kSpacing,
            ),
            CustomTitle(
              width: 20,
              height: 2,
              title: 'Phones',
              style: FontStyles.fontsBold10(context)
                  .copyWith(color: kPrimaryColor),
            ),
            const SizedBox(
              height: 3,
            ),
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
          ],
        ),
      ],
    );
  }
}
