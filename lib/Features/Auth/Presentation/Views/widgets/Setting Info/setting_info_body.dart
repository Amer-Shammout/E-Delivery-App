import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_background_container.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Setting%20Info/Setting%20info%20form/setting_info_form.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:flutter/material.dart';

class SettingInfoBody extends StatelessWidget {
  const SettingInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      color: Theme.of(context).colorScheme.surface,
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .04,
          ),
          Align(
            alignment: Alignment.center,
            child: CustomWidgetWithDash(
              dashColor: Theme.of(context).colorScheme.primary,
              widget: Text(
                'HI DEAR!',
                style: FontStyles.fontsBlack48(context)
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .05,
          ),
          const SettingInfoForm(),
        ],
      ),
    );
  }
}
