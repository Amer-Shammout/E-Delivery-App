import 'package:e_delivery_app/Features/Orders/Data/models/order_model/order_model.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/edit_order_product_slidable.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

final GlobalKey<AnimatedListState> editOrdersAnimatedKey = GlobalKey();

class EditOrdersProductsListView extends StatelessWidget {
  const EditOrdersProductsListView({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: editOrdersAnimatedKey,
      padding: const EdgeInsets.only(top: kSpacing * 6, bottom: 300),
      initialItemCount: orderModel.orderItems!.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index, animation) => FadeTransition(
        opacity: animation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: kSpacing * 6),
          child: EditOrderProductSlidable(
            orderItem: orderModel.orderItems![index],
            index: index,
            orderItems: orderModel.orderItems!,
          ),
        ),
      ),
    );
  }
}
