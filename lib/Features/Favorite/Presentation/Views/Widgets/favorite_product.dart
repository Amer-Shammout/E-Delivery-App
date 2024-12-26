import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Widgets/favorite_product_content.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteProduct extends StatelessWidget {
  const FavoriteProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Container(
        height: 124,
        padding: const EdgeInsets.only(left: kHorizontalPadding, right: kHorizontalPadding, top: kSpacing*4, bottom: kSpacing*2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.secondary, BlendMode.srcATop),
            fit: BoxFit.fill,
            image: const AssetImage(Assets.imagesFavoriteCard),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              child: AspectRatio(
                aspectRatio: 0.8,
                child: Image.asset(Assets.imagesIphoneTest),
              ),
            ),
            const SizedBox(
              width: kSpacing * 4,
            ),
            const FavoriteProductContent(),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'HOT',
                  style: AppStyles.fontsBold12(context)
                      .copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
                SvgPicture.asset(
                  width: 20,
                  height: 20,
                  Assets.iconsTrash,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.tertiary,
                    BlendMode.srcATop,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
