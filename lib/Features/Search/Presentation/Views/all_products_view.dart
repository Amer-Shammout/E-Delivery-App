import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/widgets/products_grid_view.dart';
import 'package:e_delivery_app/Features/Profile/Presentation/Views/widgets/profile_app_bar.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: S.of(context).all_products),
      body: CustomScrollView(
        slivers: [
          ProductsGridView(products: products),
        ],
      ),
    );
  }
}
