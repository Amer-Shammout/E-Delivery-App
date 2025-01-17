import 'package:e_delivery_app/Core/Data/Manager/remove_from_cart_cubit/remove_from_cart_cubit.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/edit_quantity_cubit/edit_quantity_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/order_item.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDeleteButton extends StatelessWidget {
  const CustomDeleteButton(
      {super.key, required this.productId, required this.index});
  final int index;
  final int productId;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () async {
            await BlocProvider.of<RemoveFromCartCubit>(context)
                .removeFromCart(productId);
            BlocProvider.of<EditQuantityCubit>(context)
                .cartItemQuantity!
                .orderItems!
                .removeAt(index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                width: 40,
                height: 40,
                Assets.iconsTrash,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.surface,
                  BlendMode.srcATop,
                ),
              ),
              const SizedBox(
                height: 2 * kSpacing,
              ),
              Text(
                S.of(context).delete_button,
                style: AppStyles.fontsBold14(context)
                    .copyWith(color: Theme.of(context).colorScheme.surface),
              )
            ],
          ),
        ),
        const SizedBox(
          width: kSpacing * 4,
        ),
      ],
    );
  }
}
