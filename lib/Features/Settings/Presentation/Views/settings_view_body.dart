import 'package:e_delivery_app/Core/widgets/App%20Bar/status_app_bar_builder.dart';
import 'package:e_delivery_app/Features/Settings/Presentation/Views/widgets/settings_items_list_view.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        StatusAppBarBuilder(),
        SizedBox(
          height: kSpacing * 8,
        ),
        Expanded(
          child: SettingsItemsListView(),
        ),
      ],
    );
  }
}
