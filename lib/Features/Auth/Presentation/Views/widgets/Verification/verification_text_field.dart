import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationTextField extends StatelessWidget {
  const VerificationTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 54,
          height: 64,
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
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
        ),
        SizedBox(
          width: 54,
          height: 64,
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
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
        ),
        SizedBox(
          width: 54,
          height: 64,
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
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
        ),
        SizedBox(
          width: 54,
          height: 64,
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
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
        ),
      ],
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
