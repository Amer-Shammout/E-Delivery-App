import 'package:e_delivery_app/Core/widgets/custom_card_pattern.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class OfferLoading extends StatelessWidget {
  const OfferLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kHorizontalPadding),
      child: CustomContainer(
        child: CustomCardPattern(
          opacity: 0,
          cardColor: Theme.of(context).colorScheme.secondary,
          child: const SizedBox.shrink(),
        ),
      ),
    );
  }
}
