import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/set_theme_colors.dart';
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
      this.contentColor ,
      this.radius = 12,
      this.fontSize = 20,
      this.iconSize = 16,
      this.padding = const EdgeInsets.symmetric(vertical: 5 * kSpacing),
      this.spacing = kSpacing * 2.5,
      required this.style,
      this.enableShadow = true});
  final void Function() onPressed;
  final Color fillColor;
  final Color strokeColor;
  final Color? contentColor;
  final String title;
  final String icon;
  final double radius;
  final double fontSize;
  final double iconSize;
  final double spacing;
  final EdgeInsets padding;
  final TextStyle style;
  final bool enableShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: enableShadow
              ? [
                  Shadows.ctaDropShadow,
                ]
              : null),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(10, 10),
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
              style: style.copyWith(
                color: contentColor?? (SetThemeColors.isDarkMode(context) ? kBlackColor : kWhiteColor),
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
              colorFilter: ColorFilter.mode(contentColor?? (SetThemeColors.isDarkMode(context) ? kBlackColor : kWhiteColor), BlendMode.srcATop),
            )
          ],
        ),
      ),
    );
  }
}
