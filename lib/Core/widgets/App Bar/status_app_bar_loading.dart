import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class StatusAppBarLoading extends StatelessWidget {
  const StatusAppBarLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: kHorizontalPadding,
          right: kHorizontalPadding,
          top: kSpacing * 4),
      child: Row(
        children: [
          Container(
            width: 66,
            height: 66,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
              boxShadow: const [Shadows.iconDropShadow],
            ),
          ),
          const SizedBox(
            width: 2 * kSpacing,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 12,
                width: 40,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(
                height: kSpacing * 2,
              ),
              Container(
                height: 12,
                width: 80,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(360),
              boxShadow: const [Shadows.iconDropShadow],
            ),
          ),
          const SizedBox(
            width: 4 * kSpacing,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(360),
              boxShadow: const [Shadows.iconDropShadow],
            ),
          ),
        ],
      ),
    );
  }
}
