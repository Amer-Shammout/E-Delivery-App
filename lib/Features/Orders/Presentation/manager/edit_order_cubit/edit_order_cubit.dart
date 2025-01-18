import 'package:bloc/bloc.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/cart_item_quantity.dart';
import 'package:e_delivery_app/Features/Orders/Data/repos/orders_repo.dart';
import 'package:equatable/equatable.dart';

part 'edit_order_state.dart';

class EditOrderCubit extends Cubit<EditOrderState> {
  EditOrderCubit(this._ordersRepo) : super(EditOrderInitial());
  final OrdersRepo _ordersRepo;
  Future<void> updateOrder(int id, CartItemQuantity items) async {
    emit(EditOrderLoading());
    var result = await _ordersRepo.editOrder(id, items);
    result.fold(
      (failure) {
        emit(EditOrderFailure(errMessage: failure.errMessage));
      },
      (response) {
        emit(EditOrderSuccess());
      },
    );
  }
}
