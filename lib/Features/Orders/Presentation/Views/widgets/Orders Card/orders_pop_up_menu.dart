import 'package:e_delivery_app/Core/utils/app_router.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Features/Orders/Data/models/order_model/order_model.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Orders%20Card/orders_card.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/orders_list_view.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/manager/cancel_order_cubit/cancel_order_cubit.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OrdersPopUpMenu extends StatelessWidget {
  const OrdersPopUpMenu({
    super.key,
    required this.orderModel,
    required this.cardColor,
    required this.icon,
  });

  final OrderModel orderModel;
  final Color cardColor;
  final String icon;

  @override
  Widget build(BuildContext context) {
    var popMenuItems = [
      PopupMenuItem(
        onTap: () async {
           BlocProvider.of<CancelOrderCubit>(context)
              .cancelOrder(orderModel.id!,orderModel);

          List<OrderModel> orders =
              BlocProvider.of<GetOrdersCubit>(context).orders;
          int index = orders.indexOf(orderModel);
          if (index != -1) {
            orders.remove(orderModel);
            if (BlocProvider.of<GetOrdersCubit>(context).orders.isEmpty) {
              BlocProvider.of<GetOrdersCubit>(context).emitEmptyOrdersState();
            }
            ordersAnimatedKey.currentState!.removeItem(index,
                (context, animation) {
              return FadeTransition(
                opacity: animation,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: kSpacing * 4),
                  child: OrdersCard(
                    orderModel: orderModel,
                    cardColor: cardColor,
                    icon: icon,
                    index: index,
                  ),
                ),
              );
            });
          }
        },
        value: kCancel,
        child: Text(
          S.of(context).cancel_order,
          style: AppStyles.fontsRegular16(context).copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
      PopupMenuItem(
        onTap: () {
          GoRouter.of(context)
              .pushNamed(AppRouter.kEditOrderName, extra: orderModel);
        },
        value: kEdit,
        child: Text(
          S.of(context).edit_order,
          style: AppStyles.fontsRegular16(context).copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    ];
    return PopupMenuButton(
      iconColor: kBlackColor,
      color: Theme.of(context).colorScheme.secondary,
      elevation: 0,
      itemBuilder: (context) => List.generate(
        popMenuItems.length,
        (index) {
          return popMenuItems[index];
        },
      ),
    );
  }
}
