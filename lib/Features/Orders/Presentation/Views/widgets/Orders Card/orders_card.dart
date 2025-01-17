// ignore_for_file: use_build_context_synchronously

import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/show_snack_bar.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:e_delivery_app/Core/widgets/loading/custom_circular_progress_indicator.dart';
import 'package:e_delivery_app/Features/Orders/Data/models/order_model/order_model.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Orders%20Card/order_details_table.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/Orders%20Card/orders_card_leading.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/Views/widgets/orders_list_view.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/manager/cancel_order_cubit/cancel_order_cubit.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrdersCard extends StatelessWidget {
  const OrdersCard(
      {super.key,
      required this.cardColor,
      required this.icon,
      required this.orderModel});

  final Color cardColor;
  final String icon;
  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    var popMenuItems = [
      PopupMenuItem(
        onTap: () async{
          await BlocProvider.of<CancelOrderCubit>(context)
              .cancelOrder(orderModel.id!);
          if (BlocProvider.of<CancelOrderCubit>(context).state
              is CancelOrderSuccess) {
            List<OrderModel> orders =
                BlocProvider.of<GetOrdersCubit>(context).orders;
            int index = orders.indexOf(orderModel);
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
        onTap: () {},
        value: kEdit,
        child: Text(
          S.of(context).edit_order,
          style: AppStyles.fontsRegular16(context).copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    ];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          Shadows.dropShadow.copyWith(
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ExpansionTile(
        showTrailingIcon: true,
        iconColor: kBlackColor,
        trailing: orderModel.orderStatus == 'pending'
            ? BlocConsumer<CancelOrderCubit, CancelOrderState>(
                listener: (context, state) {
                  if (state is CancelOrderFailure) {
                    showFailureSnackBar(state.errMessage, context);
                  }
                },
                builder: (context, state) {
                  if (state is CancelOrderLoading) {
                    return const CustomProgressIndicator();
                  } else {
                    return PopupMenuButton(
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
                },
              )
            : SvgPicture.asset(
                Assets.iconsDropDownArrow,
                width: 12,
                height: 12,
                colorFilter: const ColorFilter.mode(
                  kBlackColor,
                  BlendMode.srcATop,
                ),
              ),
        childrenPadding: const EdgeInsetsDirectional.only(
          start: kHorizontalPadding,
          end: kHorizontalPadding,
          bottom: kSpacing * 6,
        ),
        tilePadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        collapsedBackgroundColor: cardColor,
        backgroundColor: cardColor,
        title: Text(
          orderModel.orderStatus!,
          style: AppStyles.fontsBold16(context).copyWith(
            color: kBlackColor,
          ),
        ),
        subtitle: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: orderModel.subtotal,
                style: AppStyles.fontsRegular12(context)
                    .copyWith(color: kBlackColor),
              ),
              TextSpan(
                text: 'S.P',
                style: AppStyles.fontsSemiBold12(context)
                    .copyWith(color: kBlackColor),
              )
            ],
          ),
        ),
        leading: OrdersCardLeading(
          orderModel: orderModel,
          icon: icon,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OrderDetailsTable(orderModel: orderModel),
            ],
          ),
        ],
      ),
    );
  }
}
