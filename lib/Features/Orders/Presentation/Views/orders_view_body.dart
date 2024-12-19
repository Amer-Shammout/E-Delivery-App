import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/custom_search_bar.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/status_app_bar.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/filter_drop_down_button.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/orders_list_view.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: StatusAppBar(),
        ),
        PinnedHeaderSliver(
          child: Container(
            color: kWhiteColor,
            child: Column(
              children: [
                CustomSearchBar(
                  isEnabled: false,
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kSearchView,
                    );
                  },
                ),
                const SizedBox(
                  height: kSpacing * 4,
                ),
                const FilterDropDownButton(),
                const SizedBox(
                  height: kSpacing * 4,
                ),
              ],
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
          ),
          sliver: OrdersListView(),
        )
      ],
    );
  }
}
