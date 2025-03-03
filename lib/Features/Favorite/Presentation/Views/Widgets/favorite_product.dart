import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Manager/Services/show_alert_dialog.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Widgets/favorite_product_content.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class FavoriteProduct extends StatelessWidget {
  const FavoriteProduct({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Container(
        height: 124,
        padding: const EdgeInsets.only(
            left: kHorizontalPadding,
            right: kHorizontalPadding,
            top: kSpacing * 4,
            bottom: kSpacing * 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            matchTextDirection: true,
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.secondary, BlendMode.srcATop),
            fit: BoxFit.fill,
            image: const AssetImage(Assets.imagesFavoriteCard),
          ),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                GoRouter.of(context)
                    .pushNamed(AppRouter.kProductDetailsName, extra: product);
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                    child: AspectRatio(
                      aspectRatio: 0.8,
                      child: Image.network(product.imageUrl!),
                    ),
                  ),
                  const SizedBox(
                    width: kSpacing * 4,
                  ),
                  FavoriteProductContent(
                    product: product,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).hot,
                  style: AppStyles.fontsBold12(context)
                      .copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
                GestureDetector(
                  onTap: () {
                    ShowAlertDialog.showAlertDialog(context, product);
                  },
                  child: SvgPicture.asset(
                    width: 20,
                    height: 20,
                    Assets.iconsTrash,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.tertiary,
                      BlendMode.srcATop,
                    ),
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
