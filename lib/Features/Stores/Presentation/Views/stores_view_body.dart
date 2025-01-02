import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/custom_search_bar.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/status_app_bar_builder.dart';
import 'package:e_delivery_app/Features/Stores/Presentation/Views/widgets/stores_list_view_builder.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoresViewBody extends StatelessWidget {
  const StoresViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: StatusAppBarBuilder(),
        ),
        PinnedHeaderSliver(
          child: CustomSearchBar(
            isEnabled: false,
            onTap: () {
              GoRouter.of(context).pushNamed(
                AppRouter.kSearchName,
              );
            },
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: kSpacing * 4,
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
          ),
          sliver: StoresListViewBuilder(),
        ),
      ],
    );
  }
}
