import 'package:e_delivery_app/Core/utils/widgets/App%20Bar/status_app_bar.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          StatusAppBar(),
        ],
      ),
    );
  }
}
