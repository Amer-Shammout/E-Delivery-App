import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({super.key, @required this.productModel});

  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              productModel == null ? '57,55' : productModel!.price!,
              style: AppStyles.fontsBlack20(context)
                  .copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
            const SizedBox(
              width: kSpacing,
            ),
            Text(
              S.of(context).sp,
              style: AppStyles.fontsRegular10(context)
                  .copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              S.of(context).add_button,
              style: AppStyles.fontsMedium12(context)
                  .copyWith(color: Theme.of(context).colorScheme.tertiary),
            ),
            SvgPicture.asset(
              Assets.iconsPlus,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.tertiary, BlendMode.srcATop),
            ),
          ],
        ),
      ],
    );
  }
}
