import 'dart:developer';

import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterDropDownButton extends StatefulWidget {
  const FilterDropDownButton({super.key});

  @override
  State<FilterDropDownButton> createState() => _FilterDropDownButtonState();
}

class _FilterDropDownButtonState extends State<FilterDropDownButton> {
  String? valueChoose = 'Newest';
  List listitem = [
    'Newest',
    'Oldest',
    'Delivered',
    'On the way',
    'Preparing',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
      ),
      height: 40,
      padding: const EdgeInsets.symmetric(
        vertical: kSpacing * 2,
        horizontal: kSpacing * 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kWhiteColor,
        boxShadow: const [Shadows.dropDownButtonDropShadow],
      ),
      child: DropdownButton(
        iconSize: 12,
        value: valueChoose,
        icon: SvgPicture.asset(
          Assets.iconsDropDownArrow,
          colorFilter: const ColorFilter.mode(
            kPrimaryColor,
            BlendMode.srcATop,
          ),
          width: 12,
          height: 12,
        ),
        isExpanded: true,
        underline: const SizedBox(),
        style: FontStyles.fontsSemiBold16(context),
        elevation: 0,
        borderRadius: BorderRadius.circular(12),
        dropdownColor: kWhiteColor,
        focusColor: kPrimaryColor,
        items: List.generate(listitem.length, (index) {
          return DropdownMenuItem(
            value: listitem[index],
            child: Text(
              listitem[index],
            ),
          );
        }),
        onChanged: (value) {
          setState(() {
            valueChoose = value.toString();
            log(value.toString());
          });
        },
      ),
    );
  }
}
