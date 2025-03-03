import 'package:e_delivery_app/Core/utils/functions/set_theme_colors.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.hint,
      this.onChanged,
      this.maxLines,
      this.textInputType = TextInputType.text,
      this.prefix,
      @required this.validator,
      this.maxLength,
      this.suffixIcon,
      this.contentPadding = 24,
      this.initialValue,
      this.isEnabled = true,
      this.onSaved,
      this.onTap,
      this.onFieldSubmitted});

  final String? hint;
  final int? maxLength;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final int? maxLines;
  final TextInputType textInputType;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final double contentPadding;
  final String? initialValue;
  final bool isEnabled;
  final VoidCallback? onTap;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(contentPadding),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            boxShadow: SetThemeColors.isDarkMode(context)
                ? null
                : Shadows.innerShadow(context),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            ' ',
            style: AppStyles.fontsMedium16(context),
          ),
        ),
        TextFormField(
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          onSaved: onSaved,
          enabled: isEnabled,
          initialValue: initialValue,
          maxLength: maxLength,
          keyboardType: textInputType,
          validator: validator,
          style: AppStyles.fontsMedium16(context)
              .copyWith(color: Theme.of(context).colorScheme.error),
          cursorColor: Theme.of(context).colorScheme.primary,
          cursorErrorColor: Theme.of(context).colorScheme.tertiary,
          decoration: InputDecoration(
            counterText: '',
            prefixIcon: prefix,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: SetThemeColors.isDarkMode(context)
                ? Theme.of(context).colorScheme.secondary
                : Colors.transparent,
            contentPadding: EdgeInsets.all(contentPadding),
            hintText: hint,
            hintStyle: AppStyles.fontsMedium16(context).copyWith(
              color: Theme.of(context).colorScheme.error.withOpacity(.4),
            ),
            focusedErrorBorder:
                buildBorder(Theme.of(context).colorScheme.tertiary),
            enabledBorder: buildBorder(Colors.transparent),
            focusedBorder: buildBorder(Theme.of(context).colorScheme.primary),
            errorBorder: buildBorder(
              Theme.of(context).colorScheme.tertiary,
            ),
            disabledBorder: buildBorder(Colors.transparent),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: borderColor,
      ),
    );
  }
}
