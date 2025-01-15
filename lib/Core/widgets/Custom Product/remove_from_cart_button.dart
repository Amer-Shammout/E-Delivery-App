import 'package:e_delivery_app/Core/Data/Manager/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/functions/show_snack_bar.dart';
import 'package:e_delivery_app/Core/widgets/loading/custom_circular_progress_indicator.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/Features/Search/Presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoveFromCartButton extends StatelessWidget {
  const RemoveFromCartButton(
      {super.key,
      required this.productModel,
      required this.index,
      this.getProductsSuccess,
      this.getStoreProductsSuccess,
      this.getSearchProductsSuccess});

  final ProductModel productModel;
  final int index;
  final GetProductsByCategorySuccess? getProductsSuccess;
  final GetStoreProductsSuccess? getStoreProductsSuccess;
  final SearchSuccess? getSearchProductsSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoveFromCartCubit, RemoveFromCartState>(
      listener: (context, state) {
        if (state is RemoveFromCartFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
        if (state is RemoveFromCartSuccess) {
          // GetProductsByCategoryState state =
          //     BlocProvider.of<GetProductsByCategoryCubit>(context).state;
          if (getProductsSuccess != null) {
            getProductsSuccess!.products[index].isCart = false;
          }
          if (getSearchProductsSuccess != null) {
            getSearchProductsSuccess!.searchModel.products[index].isCart =
                false;
            BlocProvider.of<GetProductsByCategoryCubit>(context)
                .getProductsByCategory('All');
          }
          if (getStoreProductsSuccess != null) {
            getStoreProductsSuccess!.products[index].isCart = false;
            BlocProvider.of<GetProductsByCategoryCubit>(context)
                .getProductsByCategory('All');
          }
          showSuccessSnackBar(
              "The product has been removed from the cart successfully!",
              context);
        }
      },
      builder: (context, state) {
        return state is RemoveFromCartLoading
            ? const CustomProgressIndicator()
            : GestureDetector(
                onTap: () {
                  BlocProvider.of<RemoveFromCartCubit>(context)
                      .removeFromCart(productModel.id!);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.remove,
                      size: 24,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
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
