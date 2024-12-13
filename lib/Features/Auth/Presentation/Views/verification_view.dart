import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Verification/verification_text_field.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: VerificationTextField(),),
    );
  }
}