import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomProductPrice extends StatelessWidget {
  const CustomProductPrice({super.key, @required this.productModel});

  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productModel?.discountValue != null
                    ? Text(
                        '${double.parse(productModel!.price!)}',
                        style: AppStyles.fontsRegular16(context).copyWith(
                            height: 0,
                            decoration: TextDecoration.lineThrough,
                            decorationColor:
                                Theme.of(context).colorScheme.tertiary,
                            decorationThickness: 2,
                            color: Theme.of(context).colorScheme.tertiary),
                      )
                    : const SizedBox.shrink(),
                Row(
                  children: [
                    Text(
                      productModel!.discountValue != null
                          ? calculatePriceAfterDiscount(productModel!.price!,
                              productModel!.discountValue!)
                          : '${double.parse(productModel!.price!)}',
                      style: AppStyles.fontsBlack40(context).copyWith(
                          height: 0, color: checkDiscountColor(context)),
                    ),
                    const SizedBox(
                      width: kSpacing * 2,
                    ),
                    Text(
                      S.of(context).sp,
                      style: AppStyles.fontsRegular20(context)
                          .copyWith(color: checkDiscountColor(context)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Text(
              S.of(context).add_button,
              style: AppStyles.fontsMedium28(context).copyWith(
                color: checkDiscountColor(context),
              ),
            ),
            SvgPicture.asset(
              width: 32,
              height: 32,
              Assets.iconsPlus,
              colorFilter: ColorFilter.mode(
                  checkDiscountColor(context), BlendMode.srcATop),
            ),
            const SizedBox(
              width: kSpacing * 3,
            ),
          ],
        ),
      ],
    );
  }

  String calculatePriceAfterDiscount(price, discount) {
    return (double.parse(price) -
            ((double.parse(discount) / 100) * double.parse(price)))
        .toStringAsFixed(2);
  }

  Color checkDiscountColor(BuildContext context) {
    return productModel!.discountValue != null
        ? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.primary;
  }
}
