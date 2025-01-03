import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/set_theme_colors.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Core/widgets/custom_card_pattern.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/widgets/offers_page_view/offers_page_view_item_details.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/widgets/offers_page_view/offers_page_view_item_image.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class OffersPageViewItem extends StatelessWidget {
  const OffersPageViewItem({super.key, required this.offer});

  final ProductModel offer;

  @override
  Widget build(BuildContext context) {
    return CustomCardPattern(
      opacity: SetThemeColors.isDarkMode(context) ? .25 : 1,
      margin: kSpacing,
      cardColor:
          Color(int.parse(offer.storeId!.logoColor.replaceFirst('#', '0xff'))),
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
                Image.network(
                  fit: BoxFit.fill,
                  offer.storeId!.image!,
                  width: 80,
                  height: 20,
                ),
                const Spacer(),
                Text(
                  S.of(context).special_offer,
                  style: AppStyles.fontsBold24(context).copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                const SizedBox(
                  height: kSpacing * 2,
                ),
                OffersPageViewItemDetails(
                  offer: offer,
                ),
                const Spacer(),
                CTAButton(
                  contentColor: Theme.of(context).colorScheme.surface,
                  fillColor: Theme.of(context).colorScheme.primary,
                  enableShadow: false,
                  style: AppStyles.fontsSemiBold10(context),
                  onPressed: () {},
                  title: S.of(context).shop_now_button,
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
          Expanded(
            child: OffersPageViewItemImage(
              offerImage: offer.imageUrl!,
            ),
          )
        ],
      ),
    );
  }
}
