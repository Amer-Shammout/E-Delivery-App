import 'package:e_delivery_app/Core/widgets/custom_card_pattern.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class StoresListViewLoading extends StatelessWidget {
  const StoresListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(
          bottom: kSpacing * 4,
        ),
        child: CustomContainer(
      child: CustomCardPattern(
        opacity: 0,
        cardColor: Theme.of(context).colorScheme.secondary,
        child: const SizedBox.shrink(),
      ),
    ),
      ),
      itemCount: 20,
    );
  }
}