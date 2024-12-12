import 'package:e_delivery_app/Features/Auth/Presentation/Views/lets_get_started_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EDelivery());
}

class EDelivery extends StatelessWidget {
  const EDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LetsGetStartedView(),
    );
  }
}
