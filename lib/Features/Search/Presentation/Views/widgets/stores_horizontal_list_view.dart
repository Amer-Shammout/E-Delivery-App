import 'dart:developer';

import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Features/Stores/Presentation/Views/widgets/stores_card.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoresHorizontalListView extends StatelessWidget {
  const StoresHorizontalListView({
    super.key,
    required this.stores,
  });

  final List<StoreModel> stores;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          setLength(stores.length),
          (index) => Padding(
            padding: formatPadding(index),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).pushNamed(AppRouter.kStoreDetailsName,
                    extra: stores[index]);
              },
              child: StoresCard(
                cardColor: Color(stores[index].logoColor != null
                    ? int.parse(
                        stores[index].logoColor!.replaceFirst('#', '0xff'))
                    : Theme.of(context).colorScheme.primary.value),
                storeLogo: stores[index].image!,
              ),
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsetsDirectional formatPadding(int index) {
    return EdgeInsetsDirectional.only(
        start: index == 0 ? kHorizontalPadding : 0,
        end: index == (stores.length) - 1 ? kHorizontalPadding : 8);
  }

  int setLength(int length) {
    if (length != 0) {
      if (length >= 3) {
        return 3;
      }
      if (length == 2) {
        log("$length");
        return 2;
      }
      if (length == 1) {
        return 1;
      }
    }
    return 0;
  }
}
