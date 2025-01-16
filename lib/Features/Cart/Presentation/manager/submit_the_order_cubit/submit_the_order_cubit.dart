import 'package:bloc/bloc.dart';
import 'package:e_delivery_app/Features/Cart/data/repos/cart_repo.dart';
import 'package:e_delivery_app/Features/Orders/Data/order_model/order_model.dart';
import 'package:equatable/equatable.dart';

part 'submit_the_order_state.dart';

class SubmitTheOrderCubit extends Cubit<SubmitTheOrderState> {
  SubmitTheOrderCubit(this._cartRepo) : super(SubmitTheOrderInitial());
  final CartRepo _cartRepo;

  Future<void> submitTheOrder() async {
    emit(SubmitTheOrderLoading());
    var result = await _cartRepo.submitTheOrder();
    result.fold(
      (failure) {
        emit(SubmitTheOrderFailure(errMessage: failure.errMessage));
      },
      (orderModel) {
        emit(SubmitTheOrderSuccess(orderModel: orderModel));
      },
    );
  }
}
