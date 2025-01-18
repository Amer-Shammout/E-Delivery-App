import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/Features/Orders/Data/models/order_model/order_model.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/item_bottom_sheet.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/manager/edit_order_prices_cubit/edit_order_prices_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditOrderBottomSheet extends StatelessWidget {
  const EditOrderBottomSheet({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditOrderPricesCubit, EditOrderPricesState>(
      builder: (context, state) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemBottomSheet(
                      title: S.of(context).cart2,
                      value: state.selectedItems.toStringAsFixed(2)),
                  const SizedBox(
                    height: 16,
                  ),
                  ItemBottomSheet(
                      title: S.of(context).cart3,
                      value: state.deliveryCharge.toStringAsFixed(2)),
                  Divider(
                    height: 24,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.25),
                    thickness: 1.5,
                  ),
                  ItemBottomSheet(
                      title: S.of(context).cart4,
                      value: state.subtotal.toStringAsFixed(2)),
                  const SizedBox(
                    height: 32,
                  ),
                  CTAButton(
                    onPressed: () async {
                      await BlocProvider.of<GetProductsByCategoryCubit>(context)
                          .getProductsByCategory(
                              Prefs.getString(kLang) == 'en' ? "All" : 'الكل');
                      GoRouter.of(context).pop();
                    },
                    title: S.of(context).edit_button,
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
