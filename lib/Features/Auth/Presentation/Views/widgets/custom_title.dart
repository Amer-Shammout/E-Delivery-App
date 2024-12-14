import 'package:e_delivery_app/Core/widgets/custom_dash.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
    required this.style,
    this.dashColor = kPrimaryColor,
    this.width = 75,
    this.height = 10,
  });

  final String title;
  final TextStyle style;
  final Color dashColor;
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: style),
        CustomDash(
          width: width,
          height: height,
          color: dashColor,
        ),
      ],
    );
  }
}
