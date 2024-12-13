import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Verification/Verification%20Form/verification_text_field_square.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class VerificationTextField extends StatelessWidget {
  const VerificationTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        VerificationTextFieldSquare(
          onChanged: (value) {
            firstSquareMethod(context, value);
          },
          onSaved: (data) {},
        ),
        const SizedBox(
          width: kSpacing * 4,
        ),
        VerificationTextFieldSquare(
          onChanged: (value) {
            squareMethod(context, value);
          },
          onSaved: (data) {},
        ),
        const SizedBox(
          width: kSpacing * 4,
        ),
        VerificationTextFieldSquare(
          onChanged: (value) {
            squareMethod(context, value);
          },
          onSaved: (data) {},
        ),
        const SizedBox(
          width: kSpacing * 4,
        ),
        VerificationTextFieldSquare(
          onChanged: (value) {
            lastSquareMethod(context, value);
          },
          onSaved: (data) {},
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
