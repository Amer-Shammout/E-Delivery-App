import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/product_card_button.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/Features/Search/Presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_delivery_app/Features/Store%20Details/Presentation/manager/get_store_products_cubit/get_store_products_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    @required this.productModel,
    required this.index,
    this.getProductsSuccess,
    this.getStoreProductsSuccess,
    this.getSearchProductsSuccess,
  });

  final ProductModel? productModel;
  final int index;
  final GetProductsByCategorySuccess? getProductsSuccess;
  final GetStoreProductsSuccess? getStoreProductsSuccess;
  final SearchSuccess? getSearchProductsSuccess;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              productModel!.discountValue != null
                  ? calculatePriceAfterDiscount(
                      productModel!.price!, productModel!.discountValue!)
                  : productModel!.price!,
              style: AppStyles.fontsBlack20(context)
                  .copyWith(color: checkDiscountColor(context)),
            ),
            const SizedBox(
              width: kSpacing,
            ),
            Text(
              S.of(context).sp,
              style: AppStyles.fontsRegular10(context)
                  .copyWith(color: checkDiscountColor(context)),
            ),
          ],
        ),
        ProductCardButton(
          productModel: productModel!,
          isCart: productModel!.isCart!,
          index: index,
          homeState: getProductsSuccess,
          searchState: getSearchProductsSuccess,
          storeState: getStoreProductsSuccess,
        ),
      ],
    );
  }

  Color checkDiscountColor(BuildContext context) {
    return productModel?.discountValue != null
        ? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.primary;
  }

  String calculatePriceAfterDiscount(price, discount) {
    return (double.parse(price) -
            ((double.parse(discount) / 100) * double.parse(price)))
        .toStringAsFixed(2);
  }
}
