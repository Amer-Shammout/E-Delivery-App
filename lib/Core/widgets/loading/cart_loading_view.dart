import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/Features/Cart/Presentation/Views/Widgets/Cart%20View%20Widgets/custom_cart_app_bar.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class CartLoadingView extends StatelessWidget {
  const CartLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomCartAppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: kSpacing * 6),
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: kSpacing * 6),
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: CustomContainer(
                  child: Container(
                    height: 132,
                    padding: const EdgeInsets.only(
                        left: kSpacing * 3,
                        right: kSpacing * 3,
                        top: kSpacing * 2,
                        bottom: kSpacing),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        matchTextDirection: true,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.secondary,
                            BlendMode.srcATop),
                        fit: BoxFit.fill,
                        image: const AssetImage(
                          Assets.imagesCartCard,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
