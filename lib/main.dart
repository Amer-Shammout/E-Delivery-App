import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/widgets/c_t_a_button.dart';
import 'package:e_delivery_app/Registeration%20Form/registeration_form.dart';
import 'package:e_delivery_app/constants.dart';
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
        home: Scaffold(
          backgroundColor: kWhiteColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Center(
              child: RegisterationForm(),
            ),
          ),
        ));
  }
}
