import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_model.dart';
import 'package:e_delivery_app/Features/Cart/data/repos/cart_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_cart_state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit(this._cartRepo) : super(GetCartInitial());

  final CartRepo _cartRepo;

  Future<void> getCart() async {
    emit(GetCartLoading());
    var result = await _cartRepo.getCart();
    result.fold(
      (failure) {
        emit(GetCartFailure(errMessage: failure.errMessage));
      },
      (cartModel) {
        if (cartModel != null) {
          emit(GetCartSuccess(cartModel: cartModel));
        } else {
          emit(GetCartEmpty());
        }
      },
    );
  }
}
