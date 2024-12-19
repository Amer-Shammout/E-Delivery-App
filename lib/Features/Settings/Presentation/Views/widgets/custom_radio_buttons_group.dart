import 'package:e_delivery_app/Features/Settings/Presentation/Manager/theme_cubit/theme_cubit.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/custom_radio_buttom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRadioButtonGroup extends StatefulWidget {
  const CustomRadioButtonGroup(
      {super.key, required this.titles, required this.caller});

  final List<String> titles;
  final String caller;

  @override
  State<CustomRadioButtonGroup> createState() => _CustomRadioButtonGroupState();
}

class _CustomRadioButtonGroupState extends State<CustomRadioButtonGroup> {
  late int _value ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.titles.length,
        (index) => CustomRadioButtonListTile(
          groupValue: setGroupValue(),
          value: index + 1,
          title: widget.titles[index],
          onChanged: (value) {
            setState(() {
              _value = value;
              if (widget.caller == 'theme') {
                switch (index) {
                  case 0:
                    BlocProvider.of<ThemeCubit>(context)
                        .updateTheme(ThemeMode.light);
                    break;
                  case 1:
                    BlocProvider.of<ThemeCubit>(context)
                        .updateTheme(ThemeMode.dark);
                    break;
                  case 2:
                    BlocProvider.of<ThemeCubit>(context)
                        .updateTheme(ThemeMode.system);
                    break;
                }
              }
            });
          },
        ),
      ),
    );
  }

  setGroupValue() {
    if (widget.caller == 'theme') {
      ThemeMode themeMode = BlocProvider.of<ThemeCubit>(context).state;
      if(themeMode == ThemeMode.light) {
        return 1;
      }
      if(themeMode == ThemeMode.dark) {
        return 2;
      }
      if(themeMode == ThemeMode.system) {
        return 3;
      }
    }
  }
}
