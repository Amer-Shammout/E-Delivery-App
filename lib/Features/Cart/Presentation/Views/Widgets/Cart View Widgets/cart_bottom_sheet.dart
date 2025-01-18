import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_item_bottom_sheet.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/cubit/edit_prices_cart_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/edit_quantity_cubit/edit_quantity_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/submit_the_order_cubit/submit_the_order_cubit.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/manager/update_cart_cubit/update_cart_cubit.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_model.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key, required this.cartModel});
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditPricesCartCubit, EditPricesCartState>(
      builder: (context, state) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomItemBottomSheet(
                      title: S.of(context).cart2,
                      value: state.selectedItems.toStringAsFixed(2)),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomItemBottomSheet(
                      title: S.of(context).cart3,
                      value: state.deliveryCharge.toStringAsFixed(2)),
                  Divider(
                    height: 24,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.25),
                    thickness: 1.5,
                  ),
                  CustomItemBottomSheet(
                      title: S.of(context).cart4,
                      value: state.subtotal.toStringAsFixed(2)),
                  const SizedBox(
                    height: 32,
                  ),
                  CTAButton(
                    onPressed: () async {
                      await BlocProvider.of<UpdateCartCubit>(context)
                          .updateCart(
                              BlocProvider.of<EditQuantityCubit>(context)
                                  .cartItemQuantity!);
                      await BlocProvider.of<SubmitTheOrderCubit>(context)
                          .submitTheOrder();
                      await BlocProvider.of<GetProductsByCategoryCubit>(context)
                          .getProductsByCategory('All');
                      GoRouter.of(context).pop();
                    },
                    title: S.of(context).submit_button,
                    style: AppStyles.fontsSemiBold20(context).copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                    fillColor: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
