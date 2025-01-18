import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/cart_bottom_sheet.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_cart_app_bar.dart';
import 'package:e_delivery_app/Features/Orders/Data/models/order_model/order_model.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/custom_Edit_order_app_bar.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/edit_order_bottom_sheet.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/edit_orders_products_list_view.dart';
import 'package:flutter/material.dart';

class EditOrderViewBody extends StatelessWidget {
  const EditOrderViewBody({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomEditOrderAppBar(),
      bottomSheet: EditOrderBottomSheet(
        orderModel: orderModel,
      ),
      body: EditOrdersProductsListView(
        orderModel: orderModel,
      ),
    );
  }
}
