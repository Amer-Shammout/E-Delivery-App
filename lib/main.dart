import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/custom_product.dart';
import 'package:e_delivery_app/Core/widgets/products_grid_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/registeration_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/setting_info_view.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/Views/profile_view.dart';
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
        body: ProductsGridView(),
      ),
    );
  }
}
