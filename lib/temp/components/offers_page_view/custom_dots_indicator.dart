import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
    required this.currentPosition,
  });

  final int currentPosition;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      mainAxisAlignment: MainAxisAlignment.center,
      position: currentPosition,
      decorator: DotsDecorator(
        activeColor: kPrimaryColor,
        color: kPrimaryColor.withOpacity(
          .3,
        ),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        activeSize: const Size(16, 4),
        size: const Size(4, 4),
        shape: const CircleBorder(),
      ),
      dotsCount: 3,
    );
  }
}