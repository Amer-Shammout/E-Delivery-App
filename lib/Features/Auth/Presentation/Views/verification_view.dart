import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Verification/verification_view_body.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerificationViewBody(
        phoneNumber: phoneNumber,
      ),
    );
  }
}
