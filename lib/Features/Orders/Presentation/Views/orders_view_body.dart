import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/custom_app_bar.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Orders%20Card/orders_card.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/filter_drop_down_button.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
        FilterDropDownButton(),
        SizedBox(
          height: kSpacing * 4,
        ),
        Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding,),
          itemBuilder: (context, index) => OrdersCard(
            cardColor: kDeliveredColor,
            icon: Assets.iconsDelivered,
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: kSpacing * 4,
          ),
          itemCount: 10,
        ))
      ],
    );
  }
}
