import 'package:e_delivery_app/Core/widgets/custom_nav_bar.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/orders_view_body.dart';
import 'package:e_delivery_app/Features/Stores/Presentation/Views/widgets/stores_card.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/widgets/offers_page_view/offers_page_view.dart';
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
      home: const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OffersPageView(),
            SizedBox(height: kSpacing*6,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding,),
              child: StoresCard(),
            ),
          ],
        ),
      ),
    );
  }
}
