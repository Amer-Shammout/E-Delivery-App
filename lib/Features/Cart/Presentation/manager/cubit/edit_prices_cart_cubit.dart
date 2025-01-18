
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_prices_cart_state.dart';

class EditPricesCartCubit extends Cubit<EditPricesCartState> {
  EditPricesCartCubit(this.selectedItems, this.deliveryCharge, this.subtotal)
      : super(EditPricesCartState(
            selectedItems: selectedItems,
            deliveryCharge: deliveryCharge,
            subtotal: subtotal));
  final double selectedItems, deliveryCharge, subtotal;

  void incrementSelectedItems(double price) => emit(EditPricesCartState(
      selectedItems: state.selectedItems + price,
      deliveryCharge: state.deliveryCharge + 2000,
      subtotal: state.subtotal + price + 2000));

  void decrementSelectedItems(double price) => emit(EditPricesCartState(
      selectedItems: state.selectedItems - price,
      deliveryCharge: state.deliveryCharge - 2000,
      subtotal: state.subtotal - price - 2000));

  void decrementDeliveryCharge(double price, int quantity) =>
      emit(EditPricesCartState(
          selectedItems: state.selectedItems - (price * quantity),
          deliveryCharge: state.deliveryCharge - (2000 * quantity),
          subtotal: state.subtotal - (price * quantity) - (2000 * quantity)));
}
