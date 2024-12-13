import 'package:e_delivery_app/Core/utils/widgets/App%20Bar/custom_app_bar.dart';
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
