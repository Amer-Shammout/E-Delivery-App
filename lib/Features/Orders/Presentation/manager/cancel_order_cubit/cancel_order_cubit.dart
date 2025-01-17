import 'package:dio/dio.dart';
import 'package:e_delivery_app/Features/Orders/Data/repos/orders_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cancel_order_state.dart';

class CancelOrderCubit extends Cubit<CancelOrderState> {
  CancelOrderCubit(this._ordersRepo) : super(CancelOrderInitial());

  final OrdersRepo _ordersRepo;

  Future<void> cancelOrder(int id) async {
    emit(CancelOrderLoading());
    var result = await _ordersRepo.cancelOrder(id);
    result.fold((failure) {
      emit(CancelOrderFailure(errMessage: failure.errMessage));
    }, (response) {
      emit(CancelOrderSuccess(response: response));
    });
  }
}
