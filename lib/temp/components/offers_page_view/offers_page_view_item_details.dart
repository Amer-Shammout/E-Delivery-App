import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class OffersPageViewItemDetails extends StatelessWidget {
  const OffersPageViewItemDetails({
    super.key, required this.offerDiscount,
  });

  final double offerDiscount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Up to',
          style: FontStyles.fontsRegular14(context).copyWith(
            color: kBlackColor,
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
            color: kTeranyColor,
          ),
          child: Text(
            '${offerDiscount}%',
            style: FontStyles.fontsBlack22(context)
                .copyWith(color: kWhiteColor),
          ),
        ),
      ],
    );
  }
}