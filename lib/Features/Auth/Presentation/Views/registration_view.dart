import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Registration/registration_view_body_consumer.dart';
import 'package:flutter/material.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegistrationViewBodyConsumer(),
    );
  }
}
