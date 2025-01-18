part of 'cancel_order_cubit.dart';

sealed class CancelOrderState extends Equatable {
  const CancelOrderState();

  @override
  List<Object> get props => [];
}

final class CancelOrderInitial extends CancelOrderState {}

final class CancelOrderLoading extends CancelOrderState {
  final OrderModel orderModel;

  const CancelOrderLoading({required this.orderModel});
}

final class CancelOrderFailure extends CancelOrderState {
  final String errMessage;

  const CancelOrderFailure({required this.errMessage});
}

final class CancelOrderSuccess extends CancelOrderState {
  final dynamic response;

  const CancelOrderSuccess({required this.response});
}
