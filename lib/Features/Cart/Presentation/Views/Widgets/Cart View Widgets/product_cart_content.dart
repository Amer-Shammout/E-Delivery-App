import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_cart_price.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/product_quntity.dart';
import 'package:e_delivery_app/constants.dart';
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
                style: FontStyles.fontsMedium10(context).copyWith(
                  fontSize: 8,
                  color: kBlackColor.withOpacity(0.35),
                ),
              ),
              Row(
                children: [
                  Text(
                    'HOT',
                    style: FontStyles.fontsBold12(context)
                        .copyWith(color: kTeranyColor),
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
            style: FontStyles.fontsBold14(context).copyWith(
              color: kBlackColor,
            ),
          ),
          CustomWidgetWithDash(
            dashColor: kPrimaryColor,
            width: 20,
            height: 2,
            widget: Text(
              'Mobiles',
              style: FontStyles.fontsSemiBold12(context).copyWith(
                color: kPrimaryColor,
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
