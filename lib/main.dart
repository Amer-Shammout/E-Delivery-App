
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Registeration%20View/registeration_view.dart';
import 'package:e_delivery_app/constants.dart';
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
      home: RegisterationView(),
    );
  }
}
