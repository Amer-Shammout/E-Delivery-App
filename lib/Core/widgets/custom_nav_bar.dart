import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/custom_widget_with_dash.dart';
import 'package:e_delivery_app/Core/widgets/system_status_app_bar.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/home_view_body.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/orders_view_body.dart';
import 'package:e_delivery_app/Features/Stores/Presentation/Views/stores_view_body.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppWithNavBar extends StatefulWidget {
  const AppWithNavBar({
    super.key,
  });

  @override
  State<AppWithNavBar> createState() => _NavigationBarPages();
}

class _NavigationBarPages extends State<AppWithNavBar> {
  int index = 0;
  late List<Widget> pages;
  late PageController _pageController;

  _onPageChanged(int i) {
    setState(() {
      index = i;
    });
  }

  _onItemTapped(int i) {
    _pageController.jumpToPage(i);
  }

  @override
  void initState() {
    _pageController = PageController();
    pages = [
      const HomeViewBody(),
      const StoresViewBody(),
      const OrdersViewBody(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SystemStatusAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: kPrimaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(fontSize: 0),
        unselectedLabelStyle: const TextStyle(fontSize: 0),
        backgroundColor: kSecondaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: _onItemTapped,
        items: [
          navIcon(
              icon: Assets.iconsOutlineHomeOutline,
              activatedIcon: Assets.iconsSolidHomeBold),
          navIcon(
              icon: Assets.iconsOutlineShopsOutline,
              activatedIcon: Assets.iconsSolidShops),
          navIcon(
              icon: Assets.iconsOutlineOrdersOutline,
              activatedIcon: Assets.iconsSolidOrdersBold),
          navIcon(
              icon: Assets.iconsOutlineHeartOutline,
              activatedIcon: Assets.iconsSolidHeartBold),
          navIcon(
              icon: Assets.iconsOutlineSettingOutline,
              activatedIcon: Assets.iconsSolidSettingsBold),
        ],
      ),

      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: pages,
      ),
    );
  }

  BottomNavigationBarItem navIcon(
      {required String icon, required String activatedIcon}) {
    return BottomNavigationBarItem(
      label: '',
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: CustomWidgetWithDash(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          dashColor: Colors.transparent,
          width: 24,
          height: 4,
          widget: SvgPicture.asset(
            width: 32,
            height: 32,
            icon,
            colorFilter: ColorFilter.mode(
              kPrimaryColor.withOpacity(0.6),
              BlendMode.srcATop,
            ),
          ),
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: CustomWidgetWithDash(
          crossAxisAlignment: CrossAxisAlignment.center,
          dashColor: kPrimaryColor,
          width: 24,
          height: 4,
          spacing: 8,
          widget: SvgPicture.asset(
            width: 32,
            height: 32,
            activatedIcon,
            colorFilter: const ColorFilter.mode(
              kPrimaryColor,
              BlendMode.srcATop,
            ),
          ),
        ),
      ),
    );
  }
}
