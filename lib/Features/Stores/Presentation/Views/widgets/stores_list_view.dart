import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Features/Stores/Presentation/Views/widgets/stores_card.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class StoresListView extends StatelessWidget {
  const StoresListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(bottom: kSpacing*4,),
        child: StoresCard(
          cardColor: Color(0xff153F71),
          storeLogo: Assets.imagesSmatelLogoTest,
        ),
      ),
      itemCount: 10,
    );
  }
}
