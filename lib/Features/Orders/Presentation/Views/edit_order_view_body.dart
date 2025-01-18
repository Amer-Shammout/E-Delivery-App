import 'dart:developer';

import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/utils/functions/show_snack_bar.dart';
import 'package:e_delivery_app/Core/widgets/loading/my_app_loading_indicator.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/cubit/edit_prices_cart_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/edit_quantity_cubit/edit_quantity_cubit.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/cart_item_quantity.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/order_item.dart';
import 'package:e_delivery_app/Features/Orders/Data/models/order_model/order_model.dart';
import 'package:e_delivery_app/Features/Orders/Data/repos/orders_repo_impl.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/custom_Edit_order_app_bar.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/edit_order_bottom_sheet.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/edit_orders_products_list_view.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/manager/edit_order_cubit/edit_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditOrderViewBody extends StatelessWidget {
  const EditOrderViewBody({super.key, required this.orderModel});
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditQuantityCubit(
            const CartItemQuantity(
              orderItems: [],
            ),
          ),
        ),
        BlocProvider(
          create: (context) => EditPricesCartCubit(
            double.parse(orderModel.itemsPrice!),
            double.parse(orderModel.deliveryCharge!),
            double.parse(orderModel.subtotal!),
          ),
        ),
        BlocProvider(
          create: (context) => EditOrderCubit(getIt.get<OrdersRepoImpl>()),
        )
      ],
      child: BlocConsumer<EditOrderCubit, EditOrderState>(
        listener: (context, state) {
           if (state is EditOrderSuccess) {
            GoRouter.of(context).pop();
          }
          if (state is EditOrderFailure) {
            showFailureSnackBar(state.errMessage, context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
             inAsyncCall: state is EditOrderLoading,
            progressIndicator: myAppLottieIndicator(context),
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
        },
      ),
    );
  }
}
