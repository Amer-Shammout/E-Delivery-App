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
    return SizedBox(
      width: 54,
      height: 64,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            width: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == '') {
                return '';
              }
              return null;
            },
            onSaved: onSaved,
            onChanged: onChanged,
            style: FontStyles.fontsMedium32(context),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            cursorColor: kPrimaryColor,
            cursorErrorColor: kTeranyColor,
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                fontSize: 0,
              ),
              fillColor: kSecondaryColor,
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
              focusedErrorBorder: buildBorder(kTeranyColor),
              errorBorder: buildBorder(kTeranyColor),
            ),
          ),
        ],
      ),
    );
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
