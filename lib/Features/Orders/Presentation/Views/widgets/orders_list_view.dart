import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Orders%20Card/orders_card.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: kSpacing * 4),
        child: OrdersCard(
          cardColor: Theme.of(context).colorScheme.outline,
          icon: Assets.iconsDelivered,
        ),
      ),
      itemCount: 10,
    );
  }
}
