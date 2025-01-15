import 'package:e_delivery_app/Core/Data/Manager/add_or_remove_favorites/add_or_remove_favorites_cubit.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/styles/app_colors.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/utils/styles/app_theme.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Manager/cubits/get_favorite_products_cubit/get_favorite_products_cubit.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Widgets/favorite_product_content.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class FavoriteProduct extends StatelessWidget {
  const FavoriteProduct({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Container(
        height: 124,
        padding: const EdgeInsets.only(
            left: kHorizontalPadding,
            right: kHorizontalPadding,
            top: kSpacing * 4,
            bottom: kSpacing * 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            matchTextDirection: true,
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.secondary, BlendMode.srcATop),
            fit: BoxFit.fill,
            image: const AssetImage(Assets.imagesFavoriteCard),
          ),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                GoRouter.of(context)
                    .pushNamed(AppRouter.kProductDetailsName, extra: product);
              },
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                    child: AspectRatio(
                      aspectRatio: 0.8,
                      child: Image.network(product.imageUrl!),
                    ),
                  ),
                  const SizedBox(
                    width: kSpacing * 4,
                  ),
                  FavoriteProductContent(
                    product: product,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).hot,
                  style: AppStyles.fontsBold12(context)
                      .copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
                GestureDetector(
                  onTap: () {
                    showAlertDialog(context);
                  },
                  child: SvgPicture.asset(
                    width: 20,
                    height: 20,
                    Assets.iconsTrash,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.tertiary,
                      BlendMode.srcATop,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () async {
        GoRouter.of(context).pop();
        await BlocProvider.of<AddOrRemoveFavoritesCubit>(context)
            .addOrRemoveFavorites(product.id!);
        await BlocProvider.of<GetFavoriteProductsCubit>(context)
            .getFavoriteProducts();
        await BlocProvider.of<GetProductsByCategoryCubit>(context)
            .getProductsByCategory('All');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Favorite",
        style: TextStyle(color: Theme.of(context).colorScheme.surface),
      ),
      content: Text(
        "Would you like to remove this product from your favorite?",
        style: TextStyle(
            color: Theme.of(context).colorScheme.error.withOpacity(0.5)),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
