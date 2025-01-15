import 'package:e_delivery_app/Core/Data/Manager/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoveFromCartButton extends StatelessWidget {
  const RemoveFromCartButton({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<RemoveFromCartCubit>(context)
            .removeFromCart(productModel.id!);
      },
      child: Row(
        children: [
          Text(
            'Delete',
            style: AppStyles.fontsMedium12(context)
                .copyWith(color: checkDiscountColor(context)),
          ),
          const Icon(
            Icons.remove,
            size: 16,
          ),
          // SvgPicture.asset(
          //   Assets.iconsPlus,
          //   colorFilter: ColorFilter.mode(
          //       checkDiscountColor(context), BlendMode.srcATop),
          // ),
        ],
      ),
    );
  }

  Color checkDiscountColor(BuildContext context) {
    return productModel.discountValue != null
        ? Theme.of(context).colorScheme.tertiary
        : Theme.of(context).colorScheme.primary;
  }
}
