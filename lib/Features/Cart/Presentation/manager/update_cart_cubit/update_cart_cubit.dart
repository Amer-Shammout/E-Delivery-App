import 'package:bloc/bloc.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/cart_item_quantity.dart';
import 'package:e_delivery_app/Features/Cart/data/repos/cart_repo.dart';
import 'package:equatable/equatable.dart';

part 'update_cart_state.dart';

class UpdateCartCubit extends Cubit<UpdateCartState> {
  UpdateCartCubit(this._cartRepo) : super(UpdateCartInitial());
  final CartRepo _cartRepo;

  Future<void> updateCart(CartItemQuantity cart) async {
    emit(UpdateCartLoading());
    var result = await _cartRepo.updateCart(cart);
    result.fold(
      (failure) {
        emit(UpdateCartFailure(errMessage: failure.errMessage));
      },
      (response) {
        emit(UpdateCartSuccess());
      },
    );
  }
}
