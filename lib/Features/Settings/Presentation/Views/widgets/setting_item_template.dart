import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class SettingItemTemplate extends StatelessWidget {
  const SettingItemTemplate({super.key, required this.tile});

  final Widget tile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tile,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
          ),
          child: Divider(
            height: 0,
            color: kBlackColor.withOpacity(.2),
          ),
        ),
      ],
    );
  }
}
