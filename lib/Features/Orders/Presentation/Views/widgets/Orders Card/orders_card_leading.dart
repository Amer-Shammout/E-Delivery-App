import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrdersCardLeading extends StatelessWidget {
  const OrdersCardLeading({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        children: [
          Text(
            '1',
            style: FontStyles.fontsBold24(context).copyWith(
              color: kBlackColor.withOpacity(
                    .7,
                  ),
            ),
          ),
          const SizedBox(
            width: kSpacing * 4,
          ),
          SizedBox(
            height: 50,
            child: VerticalDivider(
              color: kBlackColor.withOpacity(
                    .4,
                  ),
            ),
          ),
          const SizedBox(
            width: kSpacing * 4,
          ),
          SvgPicture.asset(
            icon,
            colorFilter: const ColorFilter.mode(
              kBlackColor,
              BlendMode.srcATop,
            ),
            width: 40,
            height: 40,
          ),
        ],
      ),
    );
  }
}
