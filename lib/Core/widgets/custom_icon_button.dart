import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.icon, required this.color});
  final String icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SvgPicture.asset(
        width: 20,
        height: 20,
        icon,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcATop,
        ),
      ),
    );
  }
}
