import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hint,
      this.onChanged,
      this.maxLines,
      this.textInputType = TextInputType.text,
      this.prefix,
      @required this.validator,
      this.maxLength,
      this.suffixIcon});

  final String hint;
  final int? maxLength;
  final Function(String)? onChanged;
  final int? maxLines;
  final TextInputType textInputType;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      keyboardType: textInputType,
      validator: validator,
      style: FontStyles.fontsMedium16(context).copyWith(color: kBlackColor),
      decoration: InputDecoration(
        counterText: '',
        prefixIcon: prefix,
        filled: true,
        fillColor: const Color(0xffF6F7F9),
        contentPadding: const EdgeInsets.all(24),
        hintText: hint,
        hintStyle: FontStyles.fontsMedium16(context).copyWith(
          color: kBlackColor.withOpacity(.4),
        ),
        focusedErrorBorder: buildBorder(kTeranyColor),
        enabledBorder: buildBorder(Colors.transparent),
        focusedBorder: buildBorder(kBlackColor),
        errorBorder: buildBorder(
          kTeranyColor,
        ),
      ),
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
