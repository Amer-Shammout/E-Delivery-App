import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_background_container.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class StoreDetailsAppBarFlexibleSpace extends StatelessWidget {
  const StoreDetailsAppBarFlexibleSpace({
    super.key,
    required this.storeModel,
  });

  final StoreModel storeModel;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: CustomBackgroundContainer(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.only(
            top: kSpacing * 24,
          ),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: storeModel.image!,
                width: 250,
                height: 80,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 24,
                ),
              ),
              const SizedBox(
                height: kSpacing * 2,
              ),
              Text(
                storeModel.name!,
                style: AppStyles.fontsBold18(context)
                    .copyWith(color: Theme.of(context).colorScheme.error),
                textAlign: TextAlign.center,
              ),
              Text(
                '${storeModel.productsCount} ${S.of(context).product_details1}',
                style: AppStyles.fontsRegular12(context).copyWith(
                    color: Theme.of(context).colorScheme.error.withOpacity(.6)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
