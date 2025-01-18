import 'dart:developer';

import 'package:e_delivery_app/Features/Cart/Presentation/manager/cubit/edit_prices_cart_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/edit_quantity_cubit/edit_quantity_cubit.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/cart_item_quantity.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/order_item.dart';
import 'package:e_delivery_app/Features/Orders/Data/models/order_model/order_model.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/custom_Edit_order_app_bar.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/edit_order_bottom_sheet.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/edit_orders_products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditOrderViewBody extends StatelessWidget {
  const EditOrderViewBody({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditQuantityCubit(
            CartItemQuantity(
              orderItems: initCartQuantityItems(context),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => EditPricesCartCubit(
            double.parse(orderModel.itemsPrice!),
            double.parse(orderModel.deliveryCharge!),
            double.parse(orderModel.subtotal!),
          ),
        )
      ],
      child: Scaffold(
        appBar: const CustomEditOrderAppBar(),
        bottomSheet: EditOrderBottomSheet(
          orderModel: orderModel,
        ),
        body: EditOrdersProductsListView(
          orderModel: orderModel,
        ),
      ),
    );
  }

  List<OrderItem> initCartQuantityItems(BuildContext context) {
    List<OrderItem> orderItems = [];

    for (var item in orderModel.orderItems!) {
      orderItems.add(OrderItem(
          productId: item.productDetails!.id, quantity: item.quantity));
    }
    CartItemQuantity cartItemQuantity =
        CartItemQuantity(orderItems: orderItems);
    BlocProvider.of<EditQuantityCubit>(context).cartItemQuantity =
        cartItemQuantity;

    for (int index = 0;
        index <
            BlocProvider.of<EditQuantityCubit>(context)
                .cartItemQuantity!
                .orderItems!
                .length;
        index++) {
      log("index: $index , product id: ${BlocProvider.of<EditQuantityCubit>(context).cartItemQuantity!.orderItems![index].productId} , quantity: ${BlocProvider.of<EditQuantityCubit>(context).cartItemQuantity!.orderItems![index].quantity}");
    }
    return orderItems;
  }
}
