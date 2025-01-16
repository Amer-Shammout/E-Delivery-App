import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:flutter/material.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({
    super.key,
    @required this.productModel,
  });

  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productModel == null ? 'EMMATEL' : productModel!.storeId!.name!,
          style: AppStyles.fontsMedium10(context).copyWith(
            color: Theme.of(context).colorScheme.error.withOpacity(0.35),
          ),
        ),
        Text(
          productModel == null ? 'IPHONE 16 PRO MAX' : productModel!.name!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.fontsBold14(context).copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        CustomWidgetWithDash(
          dashColor: Theme.of(context).colorScheme.primary,
          widget: Text(
            productModel == null ? 'Mobiles' : productModel!.category!,
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
