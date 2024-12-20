import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_radio_buttom_list_tile.dart';
import 'package:flutter/material.dart';

class CustomRadioButtonGroup extends StatelessWidget {
  const CustomRadioButtonGroup(
      {super.key,
      required this.titles,
      required this.groupValue,
      required this.onChanged});

  final List<String> titles;
  final String groupValue;
  final dynamic Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        titles.length,
        (index) => CustomRadioButtonListTile(
          groupValue: groupValue,
          value: titles[index],
          title:
              "${titles[index].substring(0, 1).toUpperCase()}${titles[index].substring(1)}",
          onChanged: onChanged,
        ),
      ),
    );
  }
}
