import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class FavoriteProductContent extends StatelessWidget {
  const FavoriteProductContent({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.store!.name!,
          style: AppStyles.fontsMedium10(context).copyWith(
            fontSize: 8,
            color: Theme.of(context).colorScheme.error.withOpacity(0.35),
          ),
        ),
        Text(
          product.name!,
          style: AppStyles.fontsBold14(context).copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        CustomWidgetWithDash(
          dashColor: Theme.of(context).colorScheme.primary,
          width: 20,
          height: 2,
          widget: Text(
            product.category!,
            style: AppStyles.fontsSemiBold12(context).copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(
          height: kSpacing * 6,
        ),
        product.discountValue != null
            ? Text(
                '${double.parse(product.price!)}',
                style: AppStyles.fontsRegular10(context).copyWith(
                    height: 0,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Theme.of(context).colorScheme.tertiary,
                    decorationThickness: 2,
                    color: checkDiscountColor(context)),
              )
            : const SizedBox.shrink(),
        Row(
          children: [
            Text(
              product.discountValue != null
                  ? calculatePriceAfterDiscount(
                      product.price, product.discountValue)
                  : '${product.price}',
              style: AppStyles.fontsBlack20(context)
                  .copyWith(color: checkDiscountColor(context), height: 0),
            ),
            const SizedBox(
              width: kSpacing,
            ),
            Text(
              S.of(context).sp,
              style: AppStyles.fontsRegular10(context).copyWith(
                color: checkDiscountColor(context),
              ),
            ),
          ],
        )
      ],
    );
  }

  Color checkDiscountColor(BuildContext context) {
    return product.discountValue != null
        ? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.primary;
  }

  String calculatePriceAfterDiscount(price, discount) {
    return (double.parse(price) -
            ((double.parse(discount) / 100) * double.parse(price)))
        .toStringAsFixed(2);
  }
}
