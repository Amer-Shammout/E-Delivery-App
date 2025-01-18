import 'package:e_delivery_app/Core/utils/styles/app_styles.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/order_item.dart';
import 'package:e_delivery_app/Features/Orders/Data/models/order_model/order_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:e_delivery_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class OrderDetailsTable extends StatelessWidget {
  const OrderDetailsTable({
    super.key,
    required this.orderModel,
  });

  final OrderModel orderModel;

// بدنا object هون بالمستقبل
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        dividerTheme: const DividerThemeData(
          color: Colors.transparent,
          space: 0,
          thickness: 0,
          indent: 0,
          endIndent: 0,
        ),
      ),
      child: DataTable(
        dataRowMinHeight: 8,
        dataRowMaxHeight: 24,
        dividerThickness: 0,
        headingRowHeight: 32,
        horizontalMargin: 4,
        columns: [
          orderDetailsTableDataColumn(S.of(context).order_details1, context),
          orderDetailsTableDataColumn(S.of(context).order_details2, context),
          orderDetailsTableDataColumn(S.of(context).order_details3, context),
        ],
        rows: List.generate(orderModel.orderItems!.length, (index) {
          return orderDetailsTableDataRow(
              context, orderModel.orderItems![index]);
        }),
      ),
    );
  }
}

DataColumn orderDetailsTableDataColumn(String title, context) {
  return DataColumn(
    label: Text(
      textAlign: TextAlign.center,
      title,
      style: AppStyles.fontsSemiBold12(context).copyWith(
        color: kBlackColor,
      ),
    ),
  );
}

DataRow orderDetailsTableDataRow(context, OrderItem orderItem) {
  // هون منستقبل ال object بالمستقبل
  return DataRow(
    cells: [
      DataCell(
        Text(
          textAlign: TextAlign.center,
          orderItem.productDetails!.name!,
          style: AppStyles.fontsRegular10(context).copyWith(color: kBlackColor),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            textAlign: TextAlign.center,
            '${orderItem.quantity}x',
            style:
                AppStyles.fontsRegular10(context).copyWith(color: kBlackColor),
          ),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            textAlign: TextAlign.center,
            orderItem.productDetails!.price!,
            style:
                AppStyles.fontsRegular10(context).copyWith(color: kBlackColor),
          ),
        ),
      ),
    ],
  );
}
