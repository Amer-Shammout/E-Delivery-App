part of 'edit_prices_cart_cubit.dart';

class EditPricesCartState {
  EditPricesCartState(
      {required this.selectedItems,
      required this.deliveryCharge,
      required this.subtotal});
  final double selectedItems;
  final double deliveryCharge;
  final double subtotal;
}
