import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_background_container.dart';
import 'package:e_delivery_app/Features/Auth/Presentation/Views/widgets/Setting%20Info/Setting%20info%20form/setting_info_form.dart';
import 'package:e_delivery_app/Core/widgets/custom_title.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class SettingInfoBody extends StatelessWidget {
  const SettingInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .04,
          ),
          Align(
            alignment: Alignment.center,
            child: CustomTitle(
              title: 'HI DEAR!',
              style: FontStyles.fontsBlack48(context)
                  .copyWith(color: kPrimaryColor),
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
