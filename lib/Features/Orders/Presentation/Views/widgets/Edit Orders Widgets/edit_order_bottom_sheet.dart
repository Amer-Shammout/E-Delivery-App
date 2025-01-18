import 'dart:developer';

import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/cubit/edit_prices_cart_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/edit_quantity_cubit/edit_quantity_cubit.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/cart_item_quantity.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/order_item.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/Features/Orders/Data/models/order_model/order_model.dart';
import 'package:e_delivery_app/Features/Orders/Data/repos/orders_repo_impl.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/item_bottom_sheet.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/manager/edit_order_cubit/edit_order_cubit.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/manager/edit_order_prices_cubit/edit_order_prices_cubit.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/manager/get_orders_cubit/get_orders_cubit.dart';

import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditOrderBottomSheet extends StatefulWidget {
  const EditOrderBottomSheet({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  State<EditOrderBottomSheet> createState() => _EditOrderBottomSheetState();
}

class _EditOrderBottomSheetState extends State<EditOrderBottomSheet> {
  @override
  void initState() {
    initCartQuantityItems(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditPricesCartCubit, EditPricesCartState>(
      builder: (context, state) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemBottomSheet(
                      title: S.of(context).cart2,
                      value: state.selectedItems.toStringAsFixed(2)),
                  const SizedBox(
                    height: 16,
                  ),
                  ItemBottomSheet(
                      title: S.of(context).cart3,
                      value: state.deliveryCharge.toStringAsFixed(2)),
                  Divider(
                    height: 24,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.25),
                    thickness: 1.5,
                  ),
                  ItemBottomSheet(
                      title: S.of(context).cart4,
                      value: state.subtotal.toStringAsFixed(2)),
                  const SizedBox(
                    height: 32,
                  ),
                  CTAButton(
                    onPressed: () async {
                      log("${BlocProvider.of<EditQuantityCubit>(context).cartItemQuantity!}");
                      await BlocProvider.of<EditOrderCubit>(context)
                          .updateOrder(
                              widget.orderModel.id!,
                              BlocProvider.of<EditQuantityCubit>(context)
                                  .cartItemQuantity!);
                      BlocProvider.of<GetProductsByCategoryCubit>(context)
                          .getProductsByCategory(
                              Prefs.getString(kLang) == 'en' ? "All" : 'الكل');
                      BlocProvider.of<GetOrdersCubit>(context)
                          .getOrders(sort: 'newest', type: '');
                      // GoRouter.of(context).pop();
                    },
                    title: S.of(context).edit_button,
                    style: AppStyles.fontsSemiBold20(context).copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                    fillColor: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void initCartQuantityItems(BuildContext context) {
    List<OrderItem> orderItems = [];

    for (var item in widget.orderModel.orderItems!) {
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
