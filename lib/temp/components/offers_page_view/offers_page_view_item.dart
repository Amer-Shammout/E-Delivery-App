import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/temp/components/offers_page_view/offers_page_view_item_details.dart';
import 'package:e_delivery_app/temp/components/offers_page_view/offers_page_view_item_image.dart';
import 'package:flutter/material.dart';

class OffersPageViewItem extends StatelessWidget {
  const OffersPageViewItem({super.key, required this.cardColor});

  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kSpacing,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
        color: cardColor,
        image: const DecorationImage(
          image: AssetImage(
            Assets.imagesCardBackground,
          ),
          fit: BoxFit.cover,
        ),
      ),
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
                    color: kBlackColor,
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
                  onPressed: () {},
                  title: 'Shop Now',
                  icon: Assets.iconsButtonsArrow,
                  radius: 4,
                  fontSize: 10,
                  iconSize: 8,
                  spacing: kSpacing,
                  padding: const EdgeInsets.symmetric(
                    vertical: kSpacing,
                    horizontal: kSpacing * 2,
                  ),
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
