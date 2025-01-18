import 'package:e_delivery_app/Core/Data/Manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:e_delivery_app/Core/Data/Manager/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/add_to_cart_button.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/remove_from_cart_button.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProductPrice extends StatelessWidget {
  const CustomProductPrice({super.key, @required this.productModel});

  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    bool isCart = productModel!.isCart!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                productModel?.discountValue != null
                    ? Text(
                        '${double.parse(productModel!.price!)}',
                        style: AppStyles.fontsRegular16(context).copyWith(
                            height: 0,
                            decoration: TextDecoration.lineThrough,
                            decorationColor:
                                Theme.of(context).colorScheme.tertiary,
                            decorationThickness: 2,
                            color: Theme.of(context).colorScheme.tertiary),
                      )
                    : const SizedBox.shrink(),
                Row(
                  children: [
                    Text(
                      productModel!.discountValue != null
                          ? calculatePriceAfterDiscount(productModel!.price!,
                              productModel!.discountValue!)
                          : '${double.parse(productModel!.price!)}',
                      style: AppStyles.fontsBlack40(context).copyWith(
                          height: 0, color: checkDiscountColor(context)),
                    ),
                    const SizedBox(
                      width: kSpacing * 2,
                    ),
                    Text(
                      S.of(context).sp,
                      style: AppStyles.fontsRegular20(context)
                          .copyWith(color: checkDiscountColor(context)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        BlocConsumer<RemoveFromCartCubit, RemoveFromCartState>(
          listener: (context, state1) {
            if (state1 is RemoveFromCartSuccess) {
              isCart = false;
            }
          },
          builder: (context, state1) {
            return BlocConsumer<AddToCartCubit, AddToCartState>(
              builder: (context, state2) {
                return isCart
                    ? RemoveFromCartButton(
                      loadingHeight: 24,
                      loadingWidth: 24,
                        productModel: productModel!, index: -1)
                    : AddToCartButton(
                        loadingHeight: 24,
                        loadingWidth: 24,
                        productModel: productModel!,
                        index: -1,
                        height: 32,
                        width: 32,
                        textStyle: AppStyles.fontsMedium28(context).copyWith(
                          color: checkDiscountColor(context),
                        ),
                      );
              },
              listener: (context, state2) {
                if (state2 is AddToCartSuccess) {
                  isCart = true;
                }
              },
            );
          },
        )
      ],
    );
  }

  String calculatePriceAfterDiscount(price, discount) {
    return (double.parse(price) -
            ((double.parse(discount) / 100) * double.parse(price)))
        .toStringAsFixed(2);
  }

  Color checkDiscountColor(BuildContext context) {
    return productModel!.discountValue != null
        ? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.primary;
  }
}
