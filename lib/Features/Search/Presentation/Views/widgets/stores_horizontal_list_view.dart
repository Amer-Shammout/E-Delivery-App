import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Features/Search/data/models/search_model.dart';
import 'package:e_delivery_app/Features/Stores/Presentation/Views/widgets/stores_card.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoresHorizontalListView extends StatelessWidget {
  const StoresHorizontalListView({
    super.key,
    required this.searchModel,
  });

  final SearchModel? searchModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          searchModel?.stores?.length ?? 4,
          (index) => Padding(
            padding: formatPadding(index),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).pushNamed(AppRouter.kStoreDetailsName,
                    extra: searchModel!.stores![index]);
              },
              child: StoresCard(
                cardColor: Color(searchModel?.stores?[index].logoColor != null
                    ? int.parse(searchModel!.stores![index].logoColor!
                        .replaceFirst('#', '0xff'))
                    : Theme.of(context).colorScheme.primary.value),
                storeLogo: searchModel!.stores![index].image!,
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
        end: index == (searchModel?.stores?.length ?? 3) - 1
            ? kHorizontalPadding
            : 8);
  }
}
