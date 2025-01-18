import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_delete_button.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/order_item.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/edit_order_product.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EditOrderProductSlidable extends StatelessWidget {
  const EditOrderProductSlidable(
      {super.key, required this.orderItem, required this.index});
  final OrderItem orderItem;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      dragStartBehavior: DragStartBehavior.start,
      endActionPane: ActionPane(
        extentRatio: 70 / MediaQuery.sizeOf(context).width,
        motion: const ScrollMotion(),
        children: [
          CustomDeleteButton(
            productId: orderItem.productDetails!.id!,
            index: index,
            orderItem: orderItem,
          )
        ],
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: EditOrderProduct(orderItem: orderItem, index: index),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
