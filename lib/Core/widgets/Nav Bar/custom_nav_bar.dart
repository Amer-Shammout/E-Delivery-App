import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int currentIndex = 0;

  final List<String> activeIcons = [
    Assets.iconsSolidHomeBold,
    Assets.iconsSolidShops,
    Assets.iconsSolidOrdersBold,
    Assets.iconsSolidHeartBold,
    Assets.iconsSolidSettingsBold
  ];
  final List<String> inActiveIcons = [
    Assets.iconsOutlineHomeOutline,
    Assets.iconsOutlineShopsOutline,
    Assets.iconsOutlineOrdersOutline,
    Assets.iconsOutlineHeartOutline,
    Assets.iconsOutlineSettingOutline
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: SizedBox(
        height: 56,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: formatPadding(index, context),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
              child: CustomWidgetWithDash(
                crossAxisAlignment: CrossAxisAlignment.center,
                width: 26,
                height: 4,
                spacing: 8,
                dashColor:
                    currentIndex == index ? kPrimaryColor : Colors.transparent,
                widget: SvgPicture.asset(
                  width: 32,
                  height: 32,
                  formatIcon(index, currentIndex),
                  colorFilter: ColorFilter.mode(
                      formatIconColor(index, currentIndex), BlendMode.srcATop),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets formatPadding(int index, BuildContext context) {
    return index != 0 || index != 4
        ? EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.06)
        : EdgeInsets.zero;
  }

  String formatIcon(int index, int currentIndex) {
    if (currentIndex == index) {
      return activeIcons[index];
    }
    return inActiveIcons[index];
  }

  Color formatIconColor(int index, int currentIndex) {
    if (currentIndex == index) {
      return kPrimaryColor;
    }
    return kPrimaryColor.withOpacity(0.6);
  }
}
