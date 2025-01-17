import 'package:e_delivery_app/Core/widgets/loading/orders_list_view_loading.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/empty_orders_body.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/orders_list_view.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersListViewBuilder extends StatefulWidget {
  const OrdersListViewBuilder({super.key});

  @override
  State<OrdersListViewBuilder> createState() => _OrdersListViewBuilderState();
}

class _OrdersListViewBuilderState extends State<OrdersListViewBuilder> {
  @override
  void initState() {
    BlocProvider.of<GetOrdersCubit>(context).getOrders(sort: 'newest',type: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersCubit, GetOrdersState>(
      builder: (context, state) {
        if (state is GetOrdersEmpty) {
          return const SliverFillRemaining(
            child: EmptyOrdersBody(),
          );
        } else if (state is GetOrdersFailure) {
          return SliverToBoxAdapter(
            child: Text(state.errMessage),
          );
        } else if (state is GetOrdersSuccess) {
          return OrdersListView(
            orders: state.orders,
          );
        } else {
          return const OrdersListViewLoading();
        }
      },
    );
  }
}
