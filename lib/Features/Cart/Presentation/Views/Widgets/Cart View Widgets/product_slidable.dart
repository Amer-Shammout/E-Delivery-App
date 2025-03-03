import 'package:e_delivery_app/Core/Data/Manager/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import 'package:e_delivery_app/Core/Data/Repos/app_repo_impl.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_delete_button.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_card_cart.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/order_item.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductSlidable extends StatelessWidget {
  const ProductSlidable(
      {super.key, required this.orderItem, required this.index});

  final OrderItem orderItem;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RemoveFromCartCubit(getIt.get<AppRepoImpl>()),
      child: Slidable(
        dragStartBehavior: DragStartBehavior.start,
        endActionPane: ActionPane(
          extentRatio: 100 / MediaQuery.sizeOf(context).width,
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
              child: ProductCardCart(orderItem: orderItem, index: index),
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
