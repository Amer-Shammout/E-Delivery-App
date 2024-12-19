import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:flutter/material.dart';

class NoSearchOperationsBody extends StatelessWidget {
  const NoSearchOperationsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .15,
        ),
        Image.asset(
          width: MediaQuery.sizeOf(context).width * .7,
          height: MediaQuery.sizeOf(context).width * .7,
          Assets.imagesMagnifier,
        ),
        Text(
          "What are you looking for?",
          style: FontStyles.fontsBold20(context).copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        )
      ],
    );
  }
}
