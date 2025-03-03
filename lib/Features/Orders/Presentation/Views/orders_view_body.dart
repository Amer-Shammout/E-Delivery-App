import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/custom_search_bar.dart';
import 'package:e_delivery_app/Core/widgets/App%20Bar/status_app_bar_builder.dart';
import 'package:e_delivery_app/Features/Orders/Data/repos/orders_repo_impl.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/filter_drop_down_button.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/orders_list_view_builder.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/manager/cancel_order_cubit/cancel_order_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CancelOrderCubit(getIt.get<OrdersRepoImpl>()),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: StatusAppBarBuilder(),
          ),
          PinnedHeaderSliver(
            child: Container(
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                children: [
                  CustomSearchBar(
                    isEnabled: false,
                    onTap: () {
                      GoRouter.of(context).pushNamed(
                        AppRouter.kSearchName,
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
            sliver: OrdersListViewBuilder(),
          )
        ],
      ),
    );
  }
}
