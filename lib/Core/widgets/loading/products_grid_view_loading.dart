import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class ProductsGridViewLoading extends StatelessWidget {
  const ProductsGridViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            childAspectRatio: 0.75,
            crossAxisSpacing: 8),
        itemBuilder: (BuildContext context, int index) => Padding(
              padding: formatPadding(index),
              child: CustomContainer(
                child: Container(
                  padding: const EdgeInsetsDirectional.only(
                      start: 8, end: 4, top: 8, bottom: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      matchTextDirection: true,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.secondary,
                          BlendMode.srcATop),
                      fit: BoxFit.fill,
                      image: const AssetImage(
                        Assets.imagesHomeCard,
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  EdgeInsetsGeometry formatPadding(int index) {
    return index % 2 == 0
        ? const EdgeInsetsDirectional.only(start: 16)
        : const EdgeInsetsDirectional.only(end: 16);
  }
}
