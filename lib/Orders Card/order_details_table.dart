import 'package:e_delivery_app/Core/utils/styles/font_styles.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class OrderDetailsTable extends StatelessWidget {
  const OrderDetailsTable({
    super.key,
  });

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
        horizontalMargin: 0,
        headingRowHeight: 32,
        columns: [
          orderDetailsTableDataColumn('Product', context),
          orderDetailsTableDataColumn('Quantity', context),
          orderDetailsTableDataColumn('Price', context),
        ],
        rows: [
          // هون منعملن توليد بالمستقبل
          orderDetailsTableDataRow(context),
          orderDetailsTableDataRow(context),
          orderDetailsTableDataRow(context),
        ],
      ),
    );
  }
}

DataColumn orderDetailsTableDataColumn(String title, context) {
  return DataColumn(
    label: Text(
      textAlign: TextAlign.center,
      title,
      style: FontStyles.fontsSemiBold12(context).copyWith(color: kBlackColor,),
    ),
  );
}

DataRow orderDetailsTableDataRow(context) {
  // هون منستقبل ال object بالمستقبل
  return DataRow(
    cells: [
      DataCell(
        Text(
          textAlign: TextAlign.center,
          'Iphone 15',
          style: FontStyles.fontsRegular10(context).copyWith(color: kBlackColor),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            textAlign: TextAlign.center,
            '1x',
          style: FontStyles.fontsRegular10(context).copyWith(color: kBlackColor),
          ),
        ),
      ),
      DataCell(
        Center(
          child: Text(
            textAlign: TextAlign.center,
            '2M',
          style: FontStyles.fontsRegular10(context).copyWith(color: kBlackColor),
          ),
        ),
      ),
    ],
  );
}
