import 'package:e_delivery_app/Core/Data/Manager/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/functions/show_snack_bar.dart';
import 'package:e_delivery_app/Core/widgets/loading/custom_circular_progress_indicator.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/Features/Search/Presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoveFromCartButton extends StatelessWidget {
  const RemoveFromCartButton(
      {super.key,
      required this.productModel,
      required this.index,
      this.getProductsSuccess,
      this.getStoreProductsSuccess,
      this.getSearchProductsSuccess,
      this.loadingHeight = 12,
      this.loadingWidth = 12,
      this.size = 24, this.strokeWidth});

  final ProductModel productModel;
  final int index;
  final GetProductsByCategorySuccess? getProductsSuccess;
  final GetStoreProductsSuccess? getStoreProductsSuccess;
  final SearchSuccess? getSearchProductsSuccess;
  final double size, loadingHeight, loadingWidth;
  final double? strokeWidth;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoveFromCartCubit, RemoveFromCartState>(
      listener: (context, state) {
        if (state is RemoveFromCartFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
        if (state is RemoveFromCartSuccess) {
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
          if (index == -1) {
            BlocProvider.of<GetProductsByCategoryCubit>(context)
                .getProductsByCategory('All');
            BlocProvider.of<GetStoreProductsCubit>(context).getStoreProducts(
                category: 'All', storeId: productModel.store!.id!);
          }
          showSuccessSnackBar(S.of(context).remove_from_cart_message, context);
        }
      },
      builder: (context, state) {
        return state is RemoveFromCartLoading
            ? Padding(
                padding: const EdgeInsetsDirectional.only(end: kSpacing * 3),
                child: CustomProgressIndicator(
                  strokeWidth: strokeWidth ?? 2,
                  width: loadingWidth,
                  height: loadingHeight,
                  color: checkDiscountColor(context),
                ),
              )
            : GestureDetector(
                onTap: () {
                  BlocProvider.of<RemoveFromCartCubit>(context)
                      .removeFromCart(productModel.id!);
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(end: kSpacing * 2),
                  child: Icon(
                    Icons.remove,
                    size: size,
                    color: checkDiscountColor(context),
                  ),
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
