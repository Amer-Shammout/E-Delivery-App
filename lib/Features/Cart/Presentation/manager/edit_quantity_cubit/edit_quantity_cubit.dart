import 'package:bloc/bloc.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/cart_item_quantity.dart';
import 'package:equatable/equatable.dart';

part 'edit_quantity_state.dart';

class EditQuantityCubit extends Cubit<EditQuantityState> {
  EditQuantityCubit(this.cartItemQuantity) : super(EditQuantityInitial());
  CartItemQuantity? cartItemQuantity;

  void incrementQuantity(int productId, int stockQuantity, int index) {
    if (cartItemQuantity!.orderItems![index].quantity! < stockQuantity) {
      emit(EditQuantityIncrementEnabled());
      cartItemQuantity!.orderItems![index].quantity =
          cartItemQuantity!.orderItems![index].quantity! + 1;
    } else {
      emit(EditQuantityIncrementEnabled());
    }

    // for (int index = 0; index < cartItemQuantity!.orderItems!.length; index++) {
    //   if (cartItemQuantity!.orderItems![index].productId == productId) {
    //     emit(EditQuantityIncrementEnabled());
    //     cartItemQuantity!.orderItems![index].quantity =
    //         cartItemQuantity!.orderItems![index].quantity! + 1;
    //     return;
    //   }
    // }
  }

  void decrementQuantity(int productId, int index) {
    if (cartItemQuantity!.orderItems![index].quantity! > 1) {
      emit(EditQuantityDecrementEnabled());
      cartItemQuantity!.orderItems![index].quantity =
          cartItemQuantity!.orderItems![index].quantity! - 1;
    } else {
      emit(EditQuantityDecrementDisabled());
    }

    // for (int index = 0; index < cartItemQuantity!.orderItems!.length; index++) {
    //   if (cartItemQuantity!.orderItems![index].productId == productId) {
    //     emit(EditQuantityDecrementEnabled());
    //     cartItemQuantity!.orderItems![index].quantity =
    //         cartItemQuantity!.orderItems![index].quantity! - 1;
    //     return;
    //   }
    // }
  }
}
