// ignore_for_file: use_build_context_synchronously

import 'package:e_delivery_app/Core/Data/Manager/add_or_remove_favorites/add_or_remove_favorites_cubit.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/localizations_funs.dart';
import 'package:e_delivery_app/Core/utils/functions/show_snack_bar.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:e_delivery_app/Core/widgets/loading/custom_circular_progress_indicator.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({super.key, @required this.productModel});

  final ProductModel? productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RotatedBox(
          quarterTurns: LocalizationsFuns.isArabic(context) ? 2 : 0,
          child: CustomIcon(
            icon: Assets.iconsBackArrow,
            onPressed: () {
              GoRouter.of(context).pop();
            },
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),
        ),
        productModel?.discountValue != null
            ? Text(
                S.of(context).hot,
                style: AppStyles.fontsBold20(context)
                    .copyWith(color: Theme.of(context).colorScheme.tertiary),
              )
            : const SizedBox.shrink(),
        BlocConsumer<AddOrRemoveFavoritesCubit, AddOrRemoveFavoritesState>(
          listener: (context, state) {
            if (state is AddOrRemoveFavoritesFailure) {
              showFailureSnackBar(state.errMessage, context);
            }
          },
          builder: (context, state) {
            return state is AddOrRemoveFavoritesLoading
                ? const Padding(
                    padding: EdgeInsets.all(14),
                    child: CustomProgressIndicator(),
                  )
                : CustomIcon(
                    onPressed: () async {
                      await BlocProvider.of<AddOrRemoveFavoritesCubit>(context)
                          .addOrRemoveFavorites(productModel!.id!);

                      await BlocProvider.of<GetProductsByCategoryCubit>(context)
                          .getProductsByCategory("All");
                    },
                    icon: productModel!.isFavorite!
                        ? Assets.iconsSolidHeartBold
                        : Assets.iconsOutlineHeartOutline,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  );
          },
        ),
      ],
    );
  }
}
