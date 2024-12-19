import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/Features/Product/Presentation/Views/Widgets/custom_product_icon_content.dart';
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
            style: FontStyles.fontsSemiBold14(context).copyWith(
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
                  style: FontStyles.fontsBlack28(context)
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
                  style: FontStyles.fontsBlack20(context)
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
              style: FontStyles.fontsBold20(context)
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomProductIconContent(
                  text: '10 Items', icon: Assets.iconsQuantity),
              CustomProductIconContent(text: '3 Days', icon: Assets.iconsTime),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Description',
            style: FontStyles.fontsSemiBold18(context)
                .copyWith(color: Theme.of(context).colorScheme.error),
          ),
          Text(
            'iPhone 16 Pro features a Grade 5 titanium 5 titanium 5 titanium 5 titanium 5 titanium 5 titanium design with a new, refined microblasted texture  iPhone 16 Pro features a Grade 5 titanium design with a new, refined microblasted texture iPhone 16 Pro features a Grade 5 titanium design with a new, refined microblasted texture iPhone 16 Pro features a Grade 5 titanium design with a new, refined microblasted texture Load More...',
            style: FontStyles.fontsRegular16(context).copyWith(
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
