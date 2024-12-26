import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class OffersPageViewItemDetails extends StatelessWidget {
  const OffersPageViewItemDetails({
    super.key,
    required this.offerDiscount,
  });

  final double offerDiscount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          S.of(context).up_to,
          style: AppStyles.fontsRegular14(context).copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        const SizedBox(
          width: kSpacing,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.tertiary,
          ),
          child: Text(
            '$offerDiscount%',
            style: AppStyles.fontsBlack20(context)
                .copyWith(color: Theme.of(context).colorScheme.surface),
          ),
        ),
      ],
    );
  }
}
