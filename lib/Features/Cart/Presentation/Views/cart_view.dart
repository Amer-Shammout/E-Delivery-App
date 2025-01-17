import 'dart:developer';

import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/cart_bottom_sheet.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/cart_products_list_view.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_cart_app_bar.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/cubit/edit_prices_cart_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/edit_quantity_cubit/edit_quantity_cubit.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/cart_item_quantity.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/order_item.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    initCartQuantityItems(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditPricesCartCubit(
        double.parse(widget.cartModel.itemsPrice!),
        double.parse(widget.cartModel.deliveryCharge!),
        double.parse(widget.cartModel.subTotal!),
      ),
      child: Scaffold(
        appBar: const CustomCartAppBar(),
        bottomSheet: CartBottomSheet(
          cartModel: widget.cartModel,
        ),
        body: CartProductsListView(cartModel: widget.cartModel),
      ),
    );
  }

  void initCartQuantityItems(BuildContext context) {
    List<OrderItem> orderItems = [];

    for (var item in widget.cartModel.orderItems!) {
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
  }
}
