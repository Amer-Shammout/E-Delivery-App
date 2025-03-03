// ignore_for_file: use_build_context_synchronously

import 'package:e_delivery_app/Core/Data/Manager/add_or_remove_favorites/add_or_remove_favorites_cubit.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Manager/cubits/get_favorite_products_cubit/get_favorite_products_cubit.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Widgets/favorite_product.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Widgets/favorite_products_list_view.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShowAlertDialog {
  static showAlertDialog(BuildContext context, ProductModel product) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
        ),
      ),
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Submit",
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      onPressed: () async {
        List<ProductModel> products =
            BlocProvider.of<GetFavoriteProductsCubit>(context).products;
        int index = products.indexOf(product);
        products.remove(product);
        if (BlocProvider.of<GetFavoriteProductsCubit>(context)
            .products
            .isEmpty) {
          BlocProvider.of<GetFavoriteProductsCubit>(context)
              .emitEmptyFavorite();
        }
        animatedKey.currentState!.removeItem(index, (context, animation) {
          return FadeTransition(
            opacity: animation,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: kSpacing * 4,
                left: kHorizontalPadding,
                right: kHorizontalPadding,
              ),
              child: FavoriteProduct(
                product: product,
              ),
            ),
          );
        });
        BlocProvider.of<AddOrRemoveFavoritesCubit>(context)
            .addOrRemoveFavorites(product.id!);
        BlocProvider.of<GetProductsByCategoryCubit>(context)
            .getProductsByCategory(Prefs.getString(kLang) == 'en' ? "All" : 'الكل');
        GoRouter.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Confirm!",
        style: TextStyle(color: Theme.of(context).colorScheme.error),
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
