import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_item_bottom_sheet.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_model.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key, required this.cartModel});
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomItemBottomSheet(title: S.of(context).cart2),
              const SizedBox(
                height: 16,
              ),
              CustomItemBottomSheet(title: S.of(context).cart3),
              Divider(
                height: 24,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
                thickness: 1.5,
              ),
              CustomItemBottomSheet(title: S.of(context).cart4),
              const SizedBox(
                height: 32,
              ),
              CTAButton(
                onPressed: () {},
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
  }
}
