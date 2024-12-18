import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/custom_product_price.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/product_app_bar.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/product_image_mask.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/product_view_content.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return const Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 16),
      child: Column(
        children: [
          ProductAppBar(),
          Expanded(child: ProductImageMask()),
          SizedBox(
            height: kSpacing * 4,
          ),
          Expanded(
            flex: 2,
            child: ProductViewContent(),
          ),
          SizedBox(
            height: kSpacing * 15,
          ),
          CustomProductPrice(),
        ],
      ),
    );
  }
}
