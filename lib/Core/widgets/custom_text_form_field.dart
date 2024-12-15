import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:e_delivery_app/constants.dart';
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
      this.onTap});

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(contentPadding),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            boxShadow: Shadows.innerShadow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            ' ',
            style: FontStyles.fontsMedium16(context),
          ),
        ),
        TextFormField(
          onTap: onTap,
          onSaved: onSaved,
          enabled: isEnabled,
          initialValue: initialValue,
          maxLength: maxLength,
          keyboardType: textInputType,
          validator: validator,
          style: FontStyles.fontsMedium16(context).copyWith(color: kBlackColor),
          cursorColor: kPrimaryColor,
          cursorErrorColor: kTeranyColor,
          decoration: InputDecoration(
            counterText: '',
            prefixIcon: prefix,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.all(contentPadding),
            hintText: hint,
            hintStyle: FontStyles.fontsMedium16(context).copyWith(
              color: kBlackColor.withOpacity(.4),
            ),
            focusedErrorBorder: buildBorder(kTeranyColor),
            enabledBorder: buildBorder(Colors.transparent),
            focusedBorder: buildBorder(kPrimaryColor),
            errorBorder: buildBorder(
              kTeranyColor,
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
