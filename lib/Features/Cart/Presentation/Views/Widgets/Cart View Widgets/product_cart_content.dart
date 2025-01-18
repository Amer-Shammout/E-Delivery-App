import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_cart_price.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_quntity.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/order_item.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCartContent extends StatelessWidget {
  const ProductCartContent(
      {super.key, required this.orderItem, required this.index});

  final OrderItem orderItem;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pushNamed(AppRouter.kProductDetailsName,
                  extra: orderItem.productDetails!);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orderItem.productDetails!.store!.name!,
                  style: AppStyles.fontsMedium10(context).copyWith(
                    fontSize: 8,
                    color:
                        Theme.of(context).colorScheme.error.withOpacity(0.35),
                  ),
                ),
                orderItem.productDetails!.discountValue != null
                    ? Row(
                        children: [
                          Text(
                            S.of(context).hot,
                            style: AppStyles.fontsBold12(context).copyWith(
                                color: Theme.of(context).colorScheme.tertiary),
                          ),
                          const SizedBox(
                            width: kSpacing,
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Text(
            orderItem.productDetails!.name!,
            style: AppStyles.fontsBold14(context).copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          CustomWidgetWithDash(
            dashColor: Theme.of(context).colorScheme.primary,
            width: 20,
            height: 2,
            widget: Text(
              orderItem.productDetails!.category!,
              style: AppStyles.fontsSemiBold12(context).copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductCartPrice(orderItem: orderItem),
              const Spacer(),
              ProductQuantity(orderItem: orderItem, index: index),
            ],
          )
        ],
      ),
    );
  }
}
