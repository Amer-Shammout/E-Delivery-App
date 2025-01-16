import 'dart:developer';

import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon_button.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/minus_icon.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/edit_quantity_cubit/edit_quantity_cubit.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/order_item.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductQuantity extends StatefulWidget {
  const ProductQuantity(
      {super.key, required this.orderItem, required this.index});

  final OrderItem orderItem;
  final int index;

  @override
  State<ProductQuantity> createState() => _ProductQuantityState();
}

class _ProductQuantityState extends State<ProductQuantity> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditQuantityCubit, EditQuantityState>(
      builder: (context, state) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<EditQuantityCubit>(context).incrementQuantity(
                    widget.orderItem.productDetails!.id!,
                    widget.orderItem.productDetails!.stockQuantity!,
                    widget.index);
                setState(() {});
              },
              child: CustomIconButton(
                  icon: Assets.iconsPlus, color: checkDiscountColor(context)),
            )
            // PlusIcon(
            //     id: orderItem.productDetails!.id!,
            //     totalQuantity: orderItem.productDetails!.stockQuantity!,
            //     quantity: orderItem.quantity!,
            //     color: checkDiscountColor(context)),
            ,
            const SizedBox(
              width: kSpacing * 4,
            ),
            Text(
              "${BlocProvider.of<EditQuantityCubit>(context).cartItemQuantity!.orderItems![widget.index].quantity}",
              style: AppStyles.fontsBold16(context).copyWith(
                color: checkDiscountColor(context),
              ),
            ),
            const SizedBox(
              width: kSpacing * 4,
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<EditQuantityCubit>(context).decrementQuantity(
                    widget.orderItem.productDetails!.id!, widget.index);
                setState(() {});
              },
              child: CustomIconButton(
                  icon: Assets.iconsMinus, color: checkDiscountColor(context)),
            ),
            // MinusIcon(
            //     id: widget.orderItem.productDetails!.id!,
            //     quantity: widget.orderItem.quantity!,
            //     color: checkDiscountColor(context)),
          ],
        );
      },
    );
  }

  Color checkDiscountColor(BuildContext context) {
    return widget.orderItem.productDetails?.discountValue != null
        ? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.primary;
  }
}
