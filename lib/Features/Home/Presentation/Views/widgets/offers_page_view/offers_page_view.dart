import 'dart:async';

import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/widgets/offers_page_view/custom_dots_indicator.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Views/widgets/offers_page_view/offers_page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OffersPageView extends StatefulWidget {
  const OffersPageView({super.key, required this.offers});
  final List<ProductModel> offers;
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
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: swipeToNextPage,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pushNamed(
                          AppRouter.kProductDetailsName,
                          extra: widget.offers[index]);
                    },
                    child: OffersPageViewItem(offer: widget.offers[index]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: kSpacing),
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
