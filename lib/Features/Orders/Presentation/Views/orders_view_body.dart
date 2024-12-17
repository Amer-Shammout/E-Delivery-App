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
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: StatusAppBar(),
        ),
        PinnedHeaderSliver(
          child: Column(
            children: [
              CustomSearchBar(),
              SizedBox(
                height: kSpacing * 4,
              ),
              FilterDropDownButton(),
              SizedBox(
                height: kSpacing * 4,
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: kHorizontalPadding,
          ),
          sliver: OrdersListView(),
        )
      ],
    );
  }
}
