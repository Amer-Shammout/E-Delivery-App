import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class OrdersListViewLoading extends StatelessWidget {
  const OrdersListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: kSpacing * 4),
        child: Container(
          height: 130,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      itemCount: 10,
    );
  }
}
