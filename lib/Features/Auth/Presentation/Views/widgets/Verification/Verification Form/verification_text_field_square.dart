import 'package:e_delivery_app/Core/utils/functions/validation.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationTextFieldSquare extends StatelessWidget {
  const VerificationTextFieldSquare({
    super.key,
    required this.onChanged,
    required this.onSaved,
  });

  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: Shadows.innerShadow(context),
      ),
      child: TextFormField(
        validator: Validation.validateFieldIfEmpty,
        onSaved: onSaved,
        onChanged: onChanged,
        style: FontStyles.fontsMedium32(context),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        cursorColor: Theme.of(context).colorScheme.primary,
        cursorErrorColor: Theme.of(context).colorScheme.tertiary,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            fontSize: 0,
          ),
          fillColor: Colors.transparent,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          enabledBorder: buildBorder(
            Colors.transparent,
          ),
          focusedBorder: buildBorder(
            kPrimaryColor,
          ),
          focusedErrorBorder: buildBorder(Theme.of(context).colorScheme.tertiary),
          errorBorder: buildBorder(Theme.of(context).colorScheme.tertiary),
        ),
      ),
    );
    // ],
    // );
  }
}

OutlineInputBorder buildBorder(Color borderColor) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      color: borderColor,
    ),
  );
}
