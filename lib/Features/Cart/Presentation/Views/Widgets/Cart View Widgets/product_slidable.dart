import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_cart_check_box.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_delete_button.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_card_cart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductSlidable extends StatelessWidget {
  const ProductSlidable({super.key});

  @override
  Widget build(BuildContext context) {
    return const SlidableAutoCloseBehavior(
      closeWhenTapped: false,
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
            SizedBox(
              width: 16,
            ),
            CustomCartCheckBox(),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: ProductCardCart(),
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
