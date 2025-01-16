import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/product_view_content.dart';
import 'package:flutter/material.dart';

class ProductViewContentWithScrollEffect extends StatelessWidget {
  const ProductViewContentWithScrollEffect(
      {super.key, @required this.productModel});

  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: ProductViewContent(productModel: productModel),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 16,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Theme.of(context).colorScheme.secondary.withOpacity(0.25),
                  Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  Theme.of(context).colorScheme.secondary.withOpacity(0.75),
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 44,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.secondary.withOpacity(0.25),
                  Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  Theme.of(context).colorScheme.secondary.withOpacity(0.75),
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
