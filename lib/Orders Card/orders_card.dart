import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Orders%20Card/order_details_table.dart';
import 'package:e_delivery_app/Orders%20Card/orders_card_leading.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class OrdersCard extends StatelessWidget {
  const OrdersCard({super.key, required this.cardColor, required this.icon});

  final Color cardColor;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: kBlackColor,
      childrenPadding: const EdgeInsets.only(
        left: kHorizontalPadding,
        right: kHorizontalPadding,
        bottom: 24,
      ),
      tilePadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
        side: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
        side: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      collapsedBackgroundColor: cardColor,
      backgroundColor: cardColor,
      title: Text(
        'Delivered!',
        style: FontStyles.fontsBold16(context).copyWith(
          color: kBlackColor,
        ),
      ),
      subtitle: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '6M ',
              style: FontStyles.fontsRegular12(context)
                  .copyWith(color: kBlackColor),
            ),
            TextSpan(
              text: 'S.P',
              style: FontStyles.fontsSemiBold12(context)
                  .copyWith(color: kBlackColor),
            )
          ],
        ),
      ),
      leading: OrdersCardLeading(icon: icon,),
      children: const [
        OrderDetailsTable(),
      ],
    );
  }
}

