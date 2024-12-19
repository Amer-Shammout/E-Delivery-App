import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_radio_buttom_list_tile.dart';
import 'package:flutter/material.dart';

class CustomRadioButtonGroup extends StatefulWidget {
  const CustomRadioButtonGroup({super.key, required this.titles, required this.caller});

  final List<String> titles;
  final String caller;

  @override
  State<CustomRadioButtonGroup> createState() => _CustomRadioButtonGroupState();
}

class _CustomRadioButtonGroupState extends State<CustomRadioButtonGroup> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.titles.length,
        (index) => CustomRadioButtonListTile(
          groupValue: _value,
          value: index + 1,
          title: widget.titles[index],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
        ),
      ),
    );
  }
}
