import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          overlayColor: Colors.transparent),
      child: Text(
        title,
        style: FontStyles.fontsBold16(context),
      ),
    );
  }
}

class CustomTextButtonWithIcon extends StatelessWidget {
  const CustomTextButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.title,
    this.icon = Assets.iconsUpload,
  });

  final VoidCallback onPressed;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          overlayColor: Colors.transparent),
      label: Text(
        title,
        style: FontStyles.fontsRegular16(context),
      ),
      icon: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
      ),
    );
  }
}
