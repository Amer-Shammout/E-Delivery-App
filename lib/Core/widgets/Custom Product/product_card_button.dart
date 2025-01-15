import 'package:e_delivery_app/Core/Data/Manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:e_delivery_app/Core/Data/Manager/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/add_to_cart_button.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/remove_from_cart_button.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/Features/Search/Presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCardButton extends StatelessWidget {
  const ProductCardButton({
    super.key,
    required this.isCart,
    required this.productModel,
    required this.index,
    this.homeState,
    this.storeState,
    this.searchState,
  });

  final bool isCart;
  final ProductModel productModel;
  final int index;
  final GetProductsByCategorySuccess? homeState;
  final GetStoreProductsSuccess? storeState;
  final SearchSuccess? searchState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoveFromCartCubit, RemoveFromCartState>(
      builder: (context, state) {
        return BlocBuilder<AddToCartCubit, AddToCartState>(
          builder: (context, state) {
            if (homeState?.products[index].isCart ??
                storeState?.products[index].isCart ??
                searchState?.searchModel.products[index].isCart ??
                isCart) {
              return RemoveFromCartButton(
                productModel: productModel,
                index: index,
                getProductsSuccess: homeState,
                getSearchProductsSuccess: searchState,
                getStoreProductsSuccess: storeState,
              );
            } else {
              return AddToCartButton(
                productModel: productModel,
                index: index,
                getProductsSuccess: homeState,
                getSearchProductsSuccess: searchState,
                getStoreProductsSuccess: storeState,
                textStyle: AppStyles.fontsMedium12(context)
                    .copyWith(color: checkDiscountColor(context)),
              );
            }
          },
        );
      },
    );
  }

  Color checkDiscountColor(BuildContext context) {
    return productModel.discountValue != null
        ? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.primary;
  }
}
