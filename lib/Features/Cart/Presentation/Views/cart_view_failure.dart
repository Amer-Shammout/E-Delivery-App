import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Empty%20Cart%20View%20Widgets/empty_cart_app_bar.dart';
import 'package:flutter/material.dart';

class CartViewFailure extends StatelessWidget {
  const CartViewFailure({
    super.key,
    required this.errMessage,
  });

  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const EmptyCartAppBar(),
        body: Center(
          child: Text(errMessage),
        ),
      ),
    );
  }
}
