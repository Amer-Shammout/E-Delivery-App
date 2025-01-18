part of 'edit_order_prices_cubit.dart';

class EditOrderPricesState {
  final double selectedItems;
  final double deliveryCharge;
  final double subtotal;

  EditOrderPricesState(
      {required this.selectedItems,
      required this.deliveryCharge,
      required this.subtotal});
}
