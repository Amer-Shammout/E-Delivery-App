import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.color,
  });

  final VoidCallback onPressed;
  final String title;
  final Color color;

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
        style: AppStyles.fontsBold16(context).copyWith(color: color),
      ),
    );
  }
}

class CustomTextButtonWithIcon extends StatelessWidget {
  const CustomTextButtonWithIcon({
    super.key,
    this.onPressed,
    required this.title,
    this.icon = Assets.iconsUpload,
    required this.style,
    this.size = 24,
    this.color = kPrimaryColor,
  });

  final VoidCallback? onPressed;
  final String title;
  final String icon;
  final TextStyle style;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      iconAlignment: IconAlignment.end,
      onPressed: onPressed,
      style: TextButton.styleFrom(
          minimumSize: const Size(5, 5),
          padding: EdgeInsets.zero,
          elevation: 0,
          overlayColor: Colors.transparent),
      label: Text(
        title,
        style: style.copyWith(color: color),
      ),
      icon: SvgPicture.asset(
        icon,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
      ),
    );
  }
}
