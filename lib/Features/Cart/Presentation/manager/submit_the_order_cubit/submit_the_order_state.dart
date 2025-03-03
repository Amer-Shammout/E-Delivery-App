part of 'submit_the_order_cubit.dart';

sealed class SubmitTheOrderState extends Equatable {
  const SubmitTheOrderState();

  @override
  List<Object> get props => [];
}

final class SubmitTheOrderInitial extends SubmitTheOrderState {}

final class SubmitTheOrderLoading extends SubmitTheOrderState {}

final class SubmitTheOrderSuccess extends SubmitTheOrderState {
  final Response response;

  const SubmitTheOrderSuccess({required this.response});
}

final class SubmitTheOrderFailure extends SubmitTheOrderState {
  final String errMessage;

  const SubmitTheOrderFailure({required this.errMessage});
}
