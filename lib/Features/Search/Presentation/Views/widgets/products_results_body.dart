import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/widgets/products_grid_view.dart';
import 'package:e_delivery_app/Features/Search/Presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';

class ProductsResultsBody extends StatelessWidget {
  const ProductsResultsBody(
      {super.key, required this.products, this.searchSuccess});

  final List<ProductModel> products;
  final SearchSuccess? searchSuccess;

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? CustomScrollView(
            slivers: [
              // ignore: missing_required_param
              ProductsGridView(
                getSearchProductsSuccess: searchSuccess,
                products: products,
              ),
            ],
          )
        : const Text("No Search Results");
  }
}
