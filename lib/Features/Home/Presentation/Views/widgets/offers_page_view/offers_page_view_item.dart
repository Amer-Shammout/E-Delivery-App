import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Core/widgets/custom_card_pattern.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/widgets/offers_page_view/offers_page_view_item_details.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/widgets/offers_page_view/offers_page_view_item_image.dart';
import 'package:flutter/material.dart';

class OffersPageViewItem extends StatelessWidget {
  const OffersPageViewItem({super.key, required this.cardColor});

  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return CustomCardPattern(
      margin: kSpacing,
      cardColor: const Color(0xff295BA7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              kSpacing * 3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Assets.imagesSmatelLogoTest,
                  width: 80,
                  height: 20,
                ),
                const Spacer(),
                Text(
                  "Special Offer",
                  style: FontStyles.fontsBold24(context).copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                const SizedBox(
                  height: kSpacing * 2,
                ),
                const OffersPageViewItemDetails(
                  offerDiscount: 25,
                ),
                const Spacer(),
                CTAButton(
                  contentColor: Theme.of(context).colorScheme.surface,
                  fillColor: Theme.of(context).colorScheme.primary,
                  enableShadow: false,
                  style: FontStyles.fontsSemiBold10(context),
                  onPressed: () {},
                  title: 'Shop Now',
                  icon: Assets.iconsButtonsArrow,
                  radius: 6,
                  iconSize: 6,
                  fontSize: 10,
                  spacing: kSpacing,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 2 * kSpacing, vertical: kSpacing),
                )
              ],
            ),
          ),
          const Expanded(
            child: OffersPageViewItemImage(
              offerImage: Assets.imagesCarouselProductTest,
            ),
          )
        ],
      ),
    );
  }
}
