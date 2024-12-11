import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Orders%20Card/order_details.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrdersCard extends StatelessWidget {
  const OrdersCard({super.key, required this.cardColor});

  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0,),
      child: ExpansionTile(
        iconColor: kBlackColor,
        childrenPadding: const EdgeInsets.only(
          left: kSpacing*4,
          right: kSpacing*4,
          bottom: kSpacing*6,
        ),
        tilePadding: const EdgeInsets.symmetric(
          horizontal: kSpacing*4,
          vertical: kSpacing*6,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          side: const BorderSide(
            color: Color.fromARGB(0, 97, 65, 65),
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
        backgroundColor:  cardColor,
        title: Text(
          'Delivered!',
          style: FontStyles.fontsBold16(context).copyWith(color: kBlackColor,),
        ),
        subtitle: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '6M ',
                style: FontStyles.fontsRegular12(context).copyWith(color: kBlackColor),
              ),
              TextSpan(
                text: 'S.P',
                style: FontStyles.fontsSemiBold12(context).copyWith(color: kBlackColor),
              )
            ],
          ),
        ),
        leading: SvgPicture.asset(
          Assets.iconsDelivered,
          width: 40,
          height: 40,
        ),
        children: const [
          OrderDetails(),
        ],
      ),
    );
  }
}
