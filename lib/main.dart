import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/utils/widgets/App%20Bar/custom_app_bar.dart';
import 'package:e_delivery_app/Core/utils/widgets/profile_avatar.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/temp/examples/profile_avatar_examples.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EDelivery());
}

class EDelivery extends StatelessWidget {
  const EDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomAppBar(),
      ),
    );
  }
}
