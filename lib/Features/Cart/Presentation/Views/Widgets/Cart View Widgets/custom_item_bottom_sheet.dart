import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

class CustomItemBottomSheet extends StatelessWidget {
  const CustomItemBottomSheet({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.fontsMedium16(context).copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Row(
          children: [
            Text(
              '57,5',
              style: AppStyles.fontsBlack24(context)
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              'S.P',
              style: AppStyles.fontsRegular14(context).copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
