import 'package:dots_indicator/dots_indicator.dart';
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
        activeColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).colorScheme.primary.withOpacity(
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
        spacing: const EdgeInsets.only(
          right: 4,
          bottom: 8,
        ),
      ),
      dotsCount: 3,
    );
  }
}
