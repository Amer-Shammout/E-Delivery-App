import 'package:e_delivery_app/Features/Auth/Presentation/Views/registeration_view.dart';
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
      theme: ThemeData(scaffoldBackgroundColor: kWhiteColor),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RegisterationView(),
      ),
    );
  }
}
