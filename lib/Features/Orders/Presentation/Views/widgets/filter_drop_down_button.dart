import 'dart:developer';

import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/set_theme_colors.dart';
import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Core/utils/styles/shadows.dart';
import 'package:e_delivery_app/Features/Orders/Presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterDropDownButton extends StatefulWidget {
  const FilterDropDownButton({super.key});

  @override
  State<FilterDropDownButton> createState() => _FilterDropDownButtonState();
}

class _FilterDropDownButtonState extends State<FilterDropDownButton> {
  String? valueChoose = S.current.order_filter1;
  List listitem = [
    S.current.order_filter1,
    S.current.order_filter2,
    S.current.order_filter3,
    S.current.order_filter4,
    S.current.order_filter5,
    S.current.order_filter6,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
      ),
      height: 40,
      padding: const EdgeInsets.symmetric(
        vertical: kSpacing * 2,
        horizontal: kSpacing * 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: SetThemeColors.setBackgroundColor(context),
        boxShadow: const [Shadows.dropDownButtonDropShadow],
      ),
      child: DropdownButton(
        iconSize: 12,
        value: valueChoose,
        icon: SvgPicture.asset(
          Assets.iconsDropDownArrow,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary,
            BlendMode.srcATop,
          ),
          width: 12,
          height: 12,
        ),
        isExpanded: true,
        underline: const SizedBox(),
        style: AppStyles.fontsSemiBold16(context),
        elevation: 0,
        borderRadius: BorderRadius.circular(12),
        dropdownColor: Theme.of(context).colorScheme.surface,
        focusColor: Theme.of(context).colorScheme.primary,
        items: List.generate(listitem.length, (index) {
          return DropdownMenuItem(
            value: listitem[index],
            child: Text(
              listitem[index],
            ),
          );
        }),
        onChanged: (value) {
          setState(() {
            valueChoose = value.toString();
            if (valueChoose == S.of(context).order_filter1) {
              BlocProvider.of<GetOrdersCubit>(context)
                  .getOrders(sort: 'newest', type: '');
            } else if (valueChoose == S.of(context).order_filter2) {
              BlocProvider.of<GetOrdersCubit>(context)
                  .getOrders(sort: 'oldest', type: '');
            } else if (valueChoose == S.of(context).order_filter3) {
              BlocProvider.of<GetOrdersCubit>(context)
                  .getOrders(sort: '', type: 'delivered');
            } else if (valueChoose == S.of(context).order_filter4) {
              BlocProvider.of<GetOrdersCubit>(context)
                  .getOrders(sort: '', type: 'on the way');
            } else if (valueChoose == S.of(context).order_filter5) {
              BlocProvider.of<GetOrdersCubit>(context)
                  .getOrders(sort: '', type: 'preparing');
            } else if (valueChoose == S.of(context).order_filter6) {
              BlocProvider.of<GetOrdersCubit>(context)
                  .getOrders(sort: '', type: 'pending');
            }
            log(value.toString());
          });
        },
      ),
    );
  }
}
