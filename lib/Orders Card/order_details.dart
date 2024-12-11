import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Orders%20Card/order_details_table.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
     children: [
        Row(
       children: [
         Text(
           "Order number : ",
           style: FontStyles.fontsRegular12(context).copyWith(color: kBlackColor,),
         ),
         Text(
           ' 1',
           style: FontStyles.fontsBold12(context).copyWith(color: kBlackColor,),
         ),
       ],
     ),
     const SizedBox(
       height: kSpacing*2,
     ),
     const OrderDetailsTable(),
     ],
    );
  }
}
