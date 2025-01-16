import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/order_item.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductCartPrice extends StatelessWidget {
  const ProductCartPrice({super.key, required this.orderItem});

  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        orderItem.productDetails?.discountValue != null
            ? Text(
                orderItem.productDetails!.price!,
                style: AppStyles.fontsRegular14(context).copyWith(
                    height: 0,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Theme.of(context).colorScheme.tertiary,
                    decorationThickness: 2,
                    color: Theme.of(context).colorScheme.tertiary),
              )
            : const SizedBox.shrink(),
        Row(
          children: [
            Text(
              orderItem.productDetails?.discountValue != null
                  ? calculatePriceAfterDiscount(
                      orderItem.productDetails?.price!,
                      orderItem.productDetails?.discountValue!)
                  : '${double.parse(orderItem.productDetails!.price!)}',
              style: AppStyles.fontsBlack24(context)
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
        ),
      ],
    );
  }

  Color checkDiscountColor(BuildContext context) {
    return orderItem.productDetails?.discountValue != null
        ? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.primary;
  }

  String calculatePriceAfterDiscount(price, discount) {
    return (double.parse(price) -
            ((double.parse(discount) / 100) * double.parse(price)))
        .toStringAsFixed(2);
  }
}
