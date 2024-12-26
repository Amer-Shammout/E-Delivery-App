import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_cart_price.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_quntity.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductCartContent extends StatelessWidget {
  const ProductCartContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'EMMATEL',
                style: AppStyles.fontsMedium10(context).copyWith(
                  fontSize: 8,
                  color: Theme.of(context).colorScheme.error.withOpacity(0.35),
                ),
              ),
              Row(
                children: [
                  Text(
                    S.of(context).hot,
                    style: AppStyles.fontsBold12(context).copyWith(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                  const SizedBox(
                    width: kSpacing,
                  ),
                ],
              ),
            ],
          ),
          Text(
            'IPHONE 16 PRO MAX',
            style: AppStyles.fontsBold14(context).copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          CustomWidgetWithDash(
            dashColor: Theme.of(context).colorScheme.primary,
            width: 20,
            height: 2,
            widget: Text(
              'Mobiles',
              style: AppStyles.fontsSemiBold12(context).copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const Spacer(),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductCartPrice(),
              Spacer(),
              ProductQuntity(),
            ],
          )
        ],
      ),
    );
  }
}
