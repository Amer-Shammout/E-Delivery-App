import 'package:e_delivery_app/Core/utils/widgets/App%20Bar/custom_search_bar.dart';
import 'package:e_delivery_app/Core/utils/widgets/App%20Bar/status_app_bar.dart';
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
          top: 48,
          bottom: 32),
      child: Column(
        children: [
          StatusAppBar(),
          SizedBox(
            height: 16,
          ),
          CustomSearchBar()
        ],
      ),
    );
  }
}
