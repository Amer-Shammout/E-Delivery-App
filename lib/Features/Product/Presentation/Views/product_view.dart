import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/product_view_body.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return Container(
      padding: const EdgeInsets.all(8),
      color: kWhiteColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(Assets.imagesProductCard),
          ),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: ProductViewBody(),
        ),
      ),
    );
  }
}
