import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_cart_check_box.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_delete_button.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_card_cart.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/order_item.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductSlidable extends StatelessWidget {
  const ProductSlidable({super.key, required this.orderItem});

  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    return SlidableAutoCloseBehavior(
      closeWhenTapped: false,
      closeWhenOpened: true,
      child: Slidable(
        dragStartBehavior: DragStartBehavior.start,
        endActionPane: ActionPane(
          extentRatio: 88 / MediaQuery.sizeOf(context).width,
          motion: const ScrollMotion(),
          children: const [CustomDeleteButton()],
        ),
        child:  Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            const CustomCartCheckBox(),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: ProductCardCart(orderItem : orderItem),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
