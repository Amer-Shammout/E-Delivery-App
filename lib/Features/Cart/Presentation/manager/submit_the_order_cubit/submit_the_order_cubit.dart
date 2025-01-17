import 'package:dio/dio.dart';
import 'package:e_delivery_app/Features/Cart/data/repos/cart_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      (response) {
        emit(SubmitTheOrderSuccess(response: response));
      },
    );
  }
}
