import 'package:e_delivery_app/Core/widgets/App%20Bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        CustomScrollView(
          slivers: [],
        )
      ],
    );
  }
}
