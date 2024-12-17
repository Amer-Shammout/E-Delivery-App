import 'package:e_delivery_app/Features/Orders/Presentation/Views/orders_view_body.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/temp/components/offers_page_view/offers_page_view.dart';
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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: OrdersViewBody(),
      ),
    );
  }
}
