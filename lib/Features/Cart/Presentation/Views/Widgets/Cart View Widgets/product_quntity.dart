import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon_button.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/order_item.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class ProductQuntity extends StatelessWidget {
  const ProductQuntity({super.key, required this.orderItem});

  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
            icon: Assets.iconsPlus,
            color: Theme.of(context).colorScheme.tertiary),
        const SizedBox(
          width: kSpacing * 4,
        ),
        Text(
          "${orderItem.quantity}",
          style: AppStyles.fontsBold16(context).copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        const SizedBox(
          width: kSpacing * 4,
        ),
        CustomIconButton(
            icon: Assets.iconsMinus, color: checkDiscountColor(context)),
      ],
    );
  }

  Color checkDiscountColor(BuildContext context) {
    return orderItem.productDetails?.discountValue != null
        ? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.primary;
  }
}
