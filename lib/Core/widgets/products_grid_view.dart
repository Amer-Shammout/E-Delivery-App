import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/custom_product.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/Features/Search/Presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView(
      {super.key,
      required this.products,
      this.length,
      @required this.getProductsSuccess,
      @required this.getStoreProductsSuccess,
      @required this.getSearchProductsSuccess});

  final List<ProductModel> products;
  final int? length;
  final GetProductsByCategorySuccess? getProductsSuccess;
  final GetStoreProductsSuccess? getStoreProductsSuccess;
  final SearchSuccess? getSearchProductsSuccess;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: length ?? products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          childAspectRatio: 0.75,
          crossAxisSpacing: 8),
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: formatPadding(index),
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed(AppRouter.kProductDetailsName,
                extra: products[index]);
          },
          child: CustomProduct(
            productModel: products[index],
            index: index,
            getProductsSuccess: getProductsSuccess,
            getSearchProductsSuccess: getSearchProductsSuccess,
            getStoreProductsSuccess: getStoreProductsSuccess,
          ),
        ),
      ),
    );
  }

  EdgeInsetsGeometry formatPadding(int index) {
    return index % 2 == 0
        ? const EdgeInsetsDirectional.only(start: 16)
        : const EdgeInsetsDirectional.only(end: 16);
  }
}
