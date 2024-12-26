import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:flutter/material.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EMMATEL',
          style: AppStyles.fontsMedium10(context).copyWith(
            color: Theme.of(context).colorScheme.error.withOpacity(0.35),
          ),
        ),
        Text(
          'IPHONE 16 PRO MAX',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.fontsBold14(context).copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        CustomWidgetWithDash(
          dashColor: Theme.of(context).colorScheme.primary,
          widget: Text(
            'Mobiles',
            style: AppStyles.fontsBold10(context)
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          width: 20,
          height: 2,
        ),
      ],
    );
  }
}
