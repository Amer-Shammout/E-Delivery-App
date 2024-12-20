import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_delete_button.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_card_cart.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductSlidable extends StatelessWidget {
  const ProductSlidable({super.key});

  @override
  Widget build(BuildContext context) {
    return SlidableAutoCloseBehavior(
      closeWhenOpened: true,
      child: Slidable(
        dragStartBehavior: DragStartBehavior.start,
        endActionPane: ActionPane(
          extentRatio: 0.238375,
          motion: ScrollMotion(),
          children: [CustomDeleteButton()],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Expanded(
              child: ProductCardCart(),
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
