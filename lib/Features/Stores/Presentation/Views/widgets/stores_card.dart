import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/custom_card_pattern.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class StoresCard extends StatelessWidget {
  const StoresCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: CustomCardPattern(
        cardColor: const Color(0xff153F71),
        child: SizedBox(
          height: 70,
          child: AspectRatio(
            aspectRatio: 200/65,
              child: Image.asset(
            Assets.imagesSmatelLogoTest,
           
          ),),
        ),
      ),
    );
  }
}
