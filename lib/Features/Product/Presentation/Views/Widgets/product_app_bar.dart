import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/localizations_funs.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({super.key,@required this.productModel});

  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RotatedBox(
          quarterTurns: LocalizationsFuns.isArabic(context) ? 2 : 0,
          child: CustomIcon(
            icon: Assets.iconsBackArrow,
            onPressed: () {
              GoRouter.of(context).pop();
            },
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),
        ),
        productModel?.discountValue != null ? Text(
          S.of(context).hot,
          style: AppStyles.fontsBold20(context)
              .copyWith(color: Theme.of(context).colorScheme.tertiary),
        ) : const SizedBox.shrink(),
        CustomIcon(
          icon: Assets.iconsOutlineHeartOutline,
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
      ],
    );
  }
}
