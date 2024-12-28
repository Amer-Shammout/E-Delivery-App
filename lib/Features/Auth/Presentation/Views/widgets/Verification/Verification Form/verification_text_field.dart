import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Verification/Verification%20Form/verification_text_field_square.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class VerificationTextField extends StatelessWidget {
  const VerificationTextField(
      {super.key,
      required this.onSaved1,
      required this.onSaved2,
      required this.onSaved3,
      required this.onSaved4});

  final void Function(String?) onSaved1;
  final void Function(String?) onSaved2;
  final void Function(String?) onSaved3;
  final void Function(String?) onSaved4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VerificationTextFieldSquare(
          onChanged: (value) {
            firstSquareMethod(context, value);
          },
          onSaved: onSaved1,
        ),
        const SizedBox(
          width: kSpacing * 4,
        ),
        VerificationTextFieldSquare(
          onChanged: (value) {
            squareMethod(context, value);
          },
          onSaved: onSaved2,
        ),
        const SizedBox(
          width: kSpacing * 4,
        ),
        VerificationTextFieldSquare(
          onChanged: (value) {
            squareMethod(context, value);
          },
          onSaved: onSaved3,
        ),
        const SizedBox(
          width: kSpacing * 4,
        ),
        VerificationTextFieldSquare(
          onChanged: (value) {
            lastSquareMethod(context, value);
          },
          onSaved: onSaved4,
        ),
      ],
    );
  }

  firstSquareMethod(context, value) {
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    if (value.isEmpty) {
      FocusScope.of(context).unfocus();
    }
  }

  lastSquareMethod(context, value) {
    if (value.length == 1) {
      FocusScope.of(context).unfocus();
    }
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
  }

  squareMethod(context, value) {
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    if (value.isEmpty) {
      FocusScope.of(context).previousFocus();
    }
  }
}
