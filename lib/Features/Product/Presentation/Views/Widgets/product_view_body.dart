import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/custom_product_price.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/product_app_bar.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/product_image_mask.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/product_view_content_with_scroll_effect.dart';
import 'package:flutter/material.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 16),
      child: Column(
        children: [
          ProductAppBar(),
          Expanded(
            child: ProductImageMask(),
          ),
          Expanded(
            flex: 2,
            child: ProductViewContentWithScrollEffect(),
          ),
          SizedBox(
            height: 4,
          ),
          CustomProductPrice(),
        ],
      ),
    );
  }
}
