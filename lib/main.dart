import 'package:e_delivery_app/Core/widgets/custom_nav_bar.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/orders_view_body.dart';
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
      home: AppWithNavBar(),
    );
  }
}
