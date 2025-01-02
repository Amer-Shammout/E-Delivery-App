import 'package:e_delivery_app/Core/utils/functions/set_theme_colors.dart';
import 'package:e_delivery_app/Core/utils/functions/validation.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
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
        boxShadow: SetThemeColors.isDarkMode(context)
            ? null
            : Shadows.innerShadow(context),
      ),
      child: TextFormField(
        validator: (code) => Validation.validateFieldIfEmpty(code, context),
        onSaved: onSaved,
        onChanged: onChanged,
        style: AppStyles.fontsMedium32(context),
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
          fillColor: SetThemeColors.isDarkMode(context)
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          enabledBorder: buildBorder(
            Colors.transparent,
          ),
          focusedBorder: buildBorder(
            Theme.of(context).colorScheme.primary,
          ),
          focusedErrorBorder:
              buildBorder(Theme.of(context).colorScheme.tertiary),
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
