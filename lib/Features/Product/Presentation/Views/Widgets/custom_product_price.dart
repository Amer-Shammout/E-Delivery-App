import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomProductPrice extends StatelessWidget {
  const CustomProductPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '57,55',
                  style: FontStyles.fontsRegular16(context).copyWith(
                      height: 0,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: kTeranyColor,
                      decorationThickness: 2,
                      color: kTeranyColor),
                ),
                Row(
                  children: [
                    Text(
                      '57,55',
                      style: FontStyles.fontsBlack40(context).copyWith(
                        height: 0,
                        color: kTeranyColor,
                      ),
                    ),
                    const SizedBox(
                      width: kSpacing * 2,
                    ),
                    Text(
                      'S.P',
                      style: FontStyles.fontsRegular20(context)
                          .copyWith(color: kTeranyColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Add',
              style: FontStyles.fontsMedium28(context)
                  .copyWith(color: kTeranyColor),
            ),
            SvgPicture.asset(
              width: 32,
              height: 32,
              Assets.iconsPlus,
              colorFilter:
                  const ColorFilter.mode(kTeranyColor, BlendMode.srcATop),
            ),
            const SizedBox(
              width: kSpacing * 3,
            ),
          ],
        ),
      ],
    );
  }
}
