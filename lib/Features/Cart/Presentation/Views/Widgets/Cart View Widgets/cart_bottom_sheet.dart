import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_item_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomItemBottomSheet(title: 'Selected Items'),
              const SizedBox(
                height: 16,
              ),
              const CustomItemBottomSheet(title: 'Delivery Charge'),
              Divider(
                height: 24,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
                thickness: 1.5,
              ),
              const CustomItemBottomSheet(title: 'Subtotal'),
              const SizedBox(
                height: 32,
              ),
              CTAButton(
                onPressed: () {},
                title: 'SUBMIT',
                style: FontStyles.fontsSemiBold20(context).copyWith(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
