import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
      {super.key,
      this.radius = 40,
      this.backgroundColor = kWhiteColor,
      required this.icon,
      this.iconColor = kPrimaryColor,
      this.onPressed,
      this.iconSize = 16});
  final double radius;
  final Color backgroundColor;
  final String icon;
  final Color iconColor;
  final void Function()? onPressed;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(360),
        boxShadow: const [Shadows.iconDropShadow],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          height: iconSize,
          width: iconSize,
          icon,
          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcATop),
        ),
      ),
    );
  }
}
