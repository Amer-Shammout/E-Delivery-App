import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/custom_product_icon_content.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductViewContent extends StatelessWidget {
  const ProductViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
          Text(
            'EMMATEL',
            style: AppStyles.fontsSemiBold14(context).copyWith(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  maxLines: 2,
                  'IPHONE 16 PRO MAX',
                  style: AppStyles.fontsBlack28(context)
                      .copyWith(color: Theme.of(context).colorScheme.error),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: Text(
                  '25%',
                  style: AppStyles.fontsBlack20(context)
                      .copyWith(color: Theme.of(context).colorScheme.surface),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          CustomWidgetWithDash(
            dashColor: Theme.of(context).colorScheme.primary,
            width: 40,
            height: 4,
            widget: Text(
              'Mobiles',
              style: AppStyles.fontsBold20(context)
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomProductIconContent(
                  text: '10${S.of(context).product_details1}',
                  icon: Assets.iconsQuantity),
              const CustomProductIconContent(
                  text: '3 Days', icon: Assets.iconsTime),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            S.current.product_details2,
            style: AppStyles.fontsSemiBold18(context)
                .copyWith(color: Theme.of(context).colorScheme.error),
          ),
          Text(
            'iPhone 16 Pro features a Grade 5 titanium 5 titanium 5 titanium 5 titanium 5 titanium 5 titanium design with a new, refined microblasted texture  iPhone 16 Pro features a Grade 5 titanium design with a new, refined microblasted texture iPhone 16 Pro features a Grade 5 titanium design with a new, refined microblasted texture iPhone 16 Pro features a Grade 5 titanium design with a new, refined microblasted texture Load More...',
            style: AppStyles.fontsRegular16(context).copyWith(
              fontWeight: FontWeight.w100,
              color: Theme.of(context).colorScheme.error.withOpacity(0.7),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
