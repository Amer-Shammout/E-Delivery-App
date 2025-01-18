part of 'edit_order_cubit.dart';

sealed class EditOrderState extends Equatable {
  const EditOrderState();

  @override
  List<Object> get props => [];
}

final class EditOrderInitial extends EditOrderState {}

final class EditOrderLoading extends EditOrderState {}

final class EditOrderSuccess extends EditOrderState {}

final class EditOrderFailure extends EditOrderState {
  final String errMessage;

  const EditOrderFailure({required this.errMessage});
}
