import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Features/Orders/Data/models/order_model/order_model.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Orders%20Card/orders_card.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({
    super.key,
    required this.orders,
  });

  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: kSpacing * 4),
        child: OrdersCard(
          orderModel: orders[index],
          cardColor: setColor(orders[index].orderStatus!, context),
          icon: setIcon(orders[index].orderStatus!),
        ),
      ),
      itemCount: orders.length,
    );
  }

  setColor(String status, context) {
    if (status == 'delivered') {
      return Theme.of(context).colorScheme.outline;
    } else if (status == 'preparing') {
      return Theme.of(context).colorScheme.scrim;
    } else if (status == 'cart') {
      return Colors.orange;
    } else if (status == 'on the way') {
      return Theme.of(context).colorScheme.shadow;
    } else if (status == 'canceled') {
      return Colors.redAccent;
    } else if (status == 'pending') {
      return Colors.grey;
    }
  }

  setIcon(String status) {
    if (status == 'delivered') {
      return Assets.iconsDelivered;
    } else if (status == 'preparing') {
      return Assets.iconsPreparing;
    } else if (status == 'cart') {
      return Assets.iconsCart;
    } else if (status == 'on the way') {
      return Assets.iconsOnTheWay;
    } else if (status == 'canceled') {
      return Assets.iconsAbout;
    } else if (status == 'pending') {
      return Assets.iconsAbout;
    }
  }
}
