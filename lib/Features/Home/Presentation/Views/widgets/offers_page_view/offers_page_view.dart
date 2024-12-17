import 'dart:async';

import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/widgets/offers_page_view/custom_dots_indicator.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/widgets/offers_page_view/offers_page_view_item.dart';
import 'package:flutter/material.dart';

class OffersPageView extends StatefulWidget {
  const OffersPageView({super.key});

  @override
  State<OffersPageView> createState() => _OffersPageViewState();
}

class _OffersPageViewState extends State<OffersPageView> {
  int currentPosition = 0;
  // ignore: unused_field
  late Timer _timer;
  late PageController _pageController;
  @override
  void initState() {
    
    _pageController = PageController();
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: 16),
      child: SizedBox(
        height: 203,
        child: Stack(
          children: [
            CustomContainer(
              padding: EdgeInsets.zero,
              child: SizedBox(
                height: 203,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: swipeToNextPage,
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
                child: CustomDotsIndicator(
                  currentPosition: currentPosition,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void swipeToNextPage(index) {
    setState(() {
      currentPosition = index;
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 6),
      (timer) {

        if (mounted) {
  if (_pageController.page == 2) {
    _pageController.animateToPage(
      0,
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.easeInOut,
    );
  } else {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
      },
    );
  }
}
