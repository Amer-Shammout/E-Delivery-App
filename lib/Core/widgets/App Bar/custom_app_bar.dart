import 'package:e_delivery_app/Core/widgets/App%20Bar/custom_search_bar.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/status_app_bar.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
          left: kHorizontalPadding,
          right: kHorizontalPadding,
          top: kSpacing*12,
          bottom: kSpacing*4),
      child: Column(
        children: [
          StatusAppBar(),
          SizedBox(
            height: kSpacing*4,
          ),
          CustomSearchBar()
        ],
      ),
    );
  }
}
