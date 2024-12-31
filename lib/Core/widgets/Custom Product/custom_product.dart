import 'dart:developer';

import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/product_content.dart';
import 'package:e_delivery_app/Core/widgets/Custom%20Product/product_price.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("${Prefs.getString(kToken)}");
        log("${Prefs.getString(kId)}");
        GoRouter.of(context).pushNamed(AppRouter.kProductDetailsName);
      },
      child: CustomContainer(
        child: Container(
          padding: const EdgeInsetsDirectional.only(
              start: 8, end: 4, top: 8, bottom: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              matchTextDirection: true,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.secondary, BlendMode.srcATop),
              fit: BoxFit.fill,
              image: const AssetImage(
                Assets.imagesHomeCard,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Text(
                    S.of(context).hot,
                    style: AppStyles.fontsBold10(context).copyWith(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              Center(
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: Image.asset(
                    Assets.imagesIphoneTest,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const Spacer(),
              const ProductContent(),
              const Spacer(
                flex: 2,
              ),
              const ProductPrice(),
            ],
          ),
        ),
      ),
    );
  }
}
