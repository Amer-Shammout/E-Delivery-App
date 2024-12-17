import 'package:e_delivery_app/Core/widgets/App%20Bar/custom_search_bar.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/status_app_bar.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/filter_drop_down_button.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/orders_list_view.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: kHorizontalPadding,
              right: kHorizontalPadding,
              top: 16,
            ),
            child: StatusAppBar(),
          ),
        ),
        PinnedHeaderSliver(
          child: Container(
            color: kWhiteColor,
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: kHorizontalPadding,
                      right: kHorizontalPadding,
                      top: kSpacing * 4),
                  child: CustomSearchBar(),
                ),
                SizedBox(
                  height: kSpacing * 8,
                ),
                FilterDropDownButton(),
                SizedBox(
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

