import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
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
      this.suffixIcon,
      this.contentPadding = 24});

  final String hint;
  final int? maxLength;
  final Function(String)? onChanged;
  final int? maxLines;
  final TextInputType textInputType;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final double contentPadding;
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
          maxLength: maxLength,
          keyboardType: textInputType,
          validator: validator,
          style: FontStyles.fontsMedium16(context).copyWith(color: kBlackColor),
          cursorColor: kPrimaryColor,
          cursorErrorColor: kTeranyColor,
          decoration: InputDecoration(
            counterText: '',
            prefixIcon: prefix,
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
