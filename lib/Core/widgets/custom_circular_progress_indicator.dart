import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    super.key,
    this.width = 15,
    this.height = 15,
    this.strokeWidth = 2,
  });

  final double width, height, strokeWidth;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
