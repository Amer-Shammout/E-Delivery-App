import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/empty_cart_view.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EDelivery());
}

class EDelivery extends StatelessWidget {
  const EDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kWhiteColor,
      ),
      home: const EmptyCartView(),
    );
  }
}
