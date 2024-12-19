import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
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
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(Assets.imagesFavoriteCard),
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
                  style: FontStyles.fontsBold12(context)
                      .copyWith(color: kTeranyColor),
                ),
                SvgPicture.asset(
                  width: 20,
                  height: 20,
                  Assets.iconsTrash,
                  colorFilter: const ColorFilter.mode(
                    kTeranyColor,
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
