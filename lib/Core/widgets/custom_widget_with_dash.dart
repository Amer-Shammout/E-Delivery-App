import 'package:e_delivery_app/Core/widgets/custom_dash.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class CustomWidgetWithDash extends StatelessWidget {
  const CustomWidgetWithDash({
    super.key,
    this.dashColor = kPrimaryColor,
    this.width = 75,
    this.height = 10,
    required this.widget,
    this.spacing = 0,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final Color dashColor;
  final double width, height;
  final Widget widget;
  final double spacing;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        widget,
        SizedBox(
          height: spacing,
        ),
        CustomDash(
          width: width,
          height: height,
          color: dashColor,
        ),
      ],
    );
  }
}
