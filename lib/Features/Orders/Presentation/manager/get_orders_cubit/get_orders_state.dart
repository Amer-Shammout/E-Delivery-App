part of 'get_orders_cubit.dart';

sealed class GetOrdersState extends Equatable {
  const GetOrdersState();

  @override
  List<Object> get props => [];
}

final class GetOrdersInitial extends GetOrdersState {}

final class GetOrdersLoading extends GetOrdersState {}

final class GetOrdersEmpty extends GetOrdersState {}

final class GetOrdersFailure extends GetOrdersState {
  final String errMessage;

  const GetOrdersFailure({required this.errMessage});
}

final class GetOrdersSuccess extends GetOrdersState {
  final List<OrderModel> orders;

  const GetOrdersSuccess({required this.orders});
}
