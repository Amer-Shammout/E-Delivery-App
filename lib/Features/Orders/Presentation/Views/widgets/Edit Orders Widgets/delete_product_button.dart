import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/cubit/edit_prices_cart_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/edit_quantity_cubit/edit_quantity_cubit.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/order_item.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/edit_order_product_slidable.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/edit_orders_products_list_view.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DeleteProductButton extends StatelessWidget {
  const DeleteProductButton(
      {super.key,
      required this.index,
      required this.productId,
      required this.orderItem,
      required this.orderItems});

  final int index;
  final int productId;
  final OrderItem orderItem;
  final List<OrderItem> orderItems;
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
            List<OrderItem> orderItems1 = orderItems;
            OrderItem orderItem = orderItems1.removeAt(index);
            BlocProvider.of<EditQuantityCubit>(context)
                .cartItemQuantity!
                .orderItems!
                .removeAt(index);

            BlocProvider.of<EditPricesCartCubit>(context)
                .decrementDeliveryCharge(
                    double.parse(orderItem.productDetails!.price!),
                    orderItem.quantity!);

            // ignore: use_build_context_synchronously

            // ignore: use_build_context_synchronously
            BlocProvider.of<GetProductsByCategoryCubit>(context)
                .getProductsByCategory(
                    Prefs.getString(kLang) == 'ar' ? 'الكل' : 'All');
            editOrdersAnimatedKey.currentState!.removeItem(index,
                (context, animation) {
              return FadeTransition(
                opacity: animation,
                child: Padding(
                  padding: index != orderItems.length - 1
                      ? const EdgeInsets.only(bottom: kSpacing * 6)
                      : const EdgeInsets.only(bottom: 300),
                  child: EditOrderProductSlidable(
                    orderItem: orderItem,
                    index: index,
                    orderItems: orderItems1,
                  ),
                ),
              );
            });
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
