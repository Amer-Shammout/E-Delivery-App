import 'package:e_delivery_app/Features/Auth/Presentation/Views/lets_get_started_view.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/registeration_view.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

void main() {
  runApp(const EDelivery());
}

class EDelivery extends StatelessWidget {
  const EDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: RegisterationView());
  }
}
