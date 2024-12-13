import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomIconExamples extends StatelessWidget {
  const CustomIconExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIcon(
            icon: Assets.iconsUser,
            radius: 112,
            iconSize: 60,
          ),
          SizedBox(
            height: 32,
          ),
          CustomIcon(icon: Assets.iconsCart),
        ],
      ),
    );
  }
}
