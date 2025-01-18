import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Features/Orders/Data/models/order_model/order_model.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Edit%20Orders%20Widgets/item_bottom_sheet.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditOrderBottomSheet extends StatelessWidget {
  const EditOrderBottomSheet({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemBottomSheet(),
              const SizedBox(
                height: 16,
              ),
              ItemBottomSheet(),
              Divider(
                height: 24,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
                thickness: 1.5,
              ),
              ItemBottomSheet(),
              const SizedBox(
                height: 32,
              ),
              CTAButton(
                onPressed: () async {
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
  }
}
