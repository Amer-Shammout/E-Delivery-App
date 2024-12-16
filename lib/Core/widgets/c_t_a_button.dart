import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CTAButton extends StatelessWidget {
  const CTAButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.icon = Assets.iconsButtonsArrow,
      this.fillColor = kPrimaryColor,
      this.strokeColor = kPrimaryColor,
      this.contentColor = kWhiteColor,
      this.radius = 12,
      this.fontSize = 20,
      this.iconSize = 16,
      this.padding = const EdgeInsets.symmetric(vertical: 5 * kSpacing),
      this.spacing = kSpacing * 2.5});
  final void Function() onPressed;
  final Color fillColor;
  final Color strokeColor;
  final Color contentColor;
  final String title;
  final String icon;
  final double radius;
  final double fontSize;
  final double iconSize;
  final double spacing;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        Shadows.ctaDropShadow,
      ]),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          backgroundColor: fillColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: strokeColor),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: FontStyles.fontsSemiBold20(context).copyWith(
                color: contentColor,
                fontSize: fontSize,
              ),
            ),
            SizedBox(
              width: spacing,
            ),
            SvgPicture.asset(
              icon,
              height: iconSize,
              width: iconSize,
              colorFilter: ColorFilter.mode(contentColor, BlendMode.srcATop),
            )
          ],
        ),
      ),
    );
  }
}
