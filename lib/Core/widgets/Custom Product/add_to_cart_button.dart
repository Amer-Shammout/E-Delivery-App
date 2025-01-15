import 'package:e_delivery_app/Core/Data/Manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/show_snack_bar.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/loading/custom_circular_progress_indicator.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/Features/Search/Presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.productModel,
    required this.index,
    this.getProductsSuccess,
    this.getStoreProductsSuccess,
    this.getSearchProductsSuccess,
  });

  final ProductModel productModel;
  final int index;
  final GetProductsByCategorySuccess? getProductsSuccess;
  final GetStoreProductsSuccess? getStoreProductsSuccess;
  final SearchSuccess? getSearchProductsSuccess;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddToCartCubit, AddToCartState>(
      listener: (context, state) {
        if (state is AddToCartFailure) {
          showFailureSnackBar(state.errMessage, context);
        }
        if (state is AddToCartSuccess) {
          if (getProductsSuccess != null) {
            getProductsSuccess!.products[index].isCart = true;
          }
          if (getSearchProductsSuccess != null) {
            getSearchProductsSuccess!.searchModel.products[index].isCart = true;
            BlocProvider.of<GetProductsByCategoryCubit>(context)
                .getProductsByCategory('All');
          }
          if (getStoreProductsSuccess != null) {
            getStoreProductsSuccess!.products[index].isCart = true;
             BlocProvider.of<GetProductsByCategoryCubit>(context)
                .getProductsByCategory('All');
          }
          showSuccessSnackBar(
              "The product has been added to the cart successfully!", context);
        }
      },
      builder: (context, state) {
        return state is AddToCartLoading
            ? const CustomProgressIndicator()
            : GestureDetector(
                onTap: () {
                  BlocProvider.of<AddToCartCubit>(context)
                      .addToCart(productModel.id!);
                },
                child: Row(
                  children: [
                    Text(
                      S.of(context).add_button,
                      style: AppStyles.fontsMedium12(context)
                          .copyWith(color: checkDiscountColor(context)),
                    ),
                    SvgPicture.asset(
                      Assets.iconsPlus,
                      colorFilter: ColorFilter.mode(
                          checkDiscountColor(context), BlendMode.srcATop),
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
