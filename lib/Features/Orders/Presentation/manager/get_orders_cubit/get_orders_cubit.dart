import 'package:e_delivery_app/Features/Orders/Data/models/order_model/order_model.dart';
import 'package:e_delivery_app/Features/Orders/Data/repos/orders_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit(this._ordersRepo) : super(GetOrdersInitial());

  final OrdersRepo _ordersRepo;

  List<OrderModel> orders = [];

  Future<void> getOrders({required String sort, required String type}) async {
    emit(GetOrdersLoading());
    var result = await _ordersRepo.getOrders(sort: sort, type: type);
    result.fold((failure) {
      emit(GetOrdersFailure(errMessage: failure.errMessage));
    }, (orders) {
      if (orders.isEmpty) {
        emit(GetOrdersEmpty());
      } else {
        this.orders = orders;
        emit(GetOrdersSuccess(orders: orders));
      }
    });
  }

  emitEmptyOrdersState() {
    emit(GetOrdersEmpty());
  }
}
