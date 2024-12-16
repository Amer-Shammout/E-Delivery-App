import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/temp/components/offers_page_view/custom_dots_indicator.dart';
import 'package:e_delivery_app/temp/components/offers_page_view/offers_page_view_item.dart';
import 'package:flutter/material.dart';

class OffersPageView extends StatefulWidget {
  const OffersPageView({super.key});

  @override
  State<OffersPageView> createState() => _OffersPageViewState();
}

class _OffersPageViewState extends State<OffersPageView> {
  int currentPosition = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        currentPosition = _pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 203,
      child: Stack(
        children: [
          CustomContainer(
            child: SizedBox(
              height: 203,
              child: PageView(
                controller: _pageController,
                children: [
                  OffersPageViewItem(
                    cardColor: const Color(0xff295BA7).withOpacity(.2),
                  ),
                  OffersPageViewItem(
                    cardColor: const Color(0xff295BA7).withOpacity(.2),
                  ),
                  OffersPageViewItem(
                    cardColor: const Color(0xff295BA7).withOpacity(.2),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomDotsIndicator(currentPosition: currentPosition,),
            ),
          ),
        ],
      ),
    );
  }
}
