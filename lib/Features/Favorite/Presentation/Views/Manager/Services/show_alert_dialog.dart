// ignore_for_file: use_build_context_synchronously

import 'package:e_delivery_app/Core/Data/Manager/add_or_remove_favorites/add_or_remove_favorites_cubit.dart';
import 'package:e_delivery_app/Features/Favorite/Presentation/Views/Manager/cubits/get_favorite_products_cubit/get_favorite_products_cubit.dart';
import 'package:e_delivery_app/Features/Home/Presentation/Manager/Cubits/get_products_by_category_cubit/get_products_by_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShowAlertDialog {
  static showAlertDialog(BuildContext context, int productId) {
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
        BlocProvider.of<AddOrRemoveFavoritesCubit>(context)
            .addOrRemoveFavorites(productId);
        BlocProvider.of<GetFavoriteProductsCubit>(context)
            .getFavoriteProducts();
        BlocProvider.of<GetProductsByCategoryCubit>(context)
            .getProductsByCategory('All');
        GoRouter.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Confirm!",
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
