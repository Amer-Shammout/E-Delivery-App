import 'package:flutter/material.dart';

class CustomDash extends StatelessWidget {
  const CustomDash(
      {super.key,
      required this.width,
      required this.height,
      required this.color});

  final double width, height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
    );
  }
}
