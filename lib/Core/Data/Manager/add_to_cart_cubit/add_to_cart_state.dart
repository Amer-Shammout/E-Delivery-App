part of 'add_to_cart_cubit.dart';

sealed class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

final class AddToCartInitial extends AddToCartState {}

final class AddToCartFailure extends AddToCartState {
  final String errMessage;

  const AddToCartFailure({required this.errMessage});
}

final class AddToCartLoading extends AddToCartState {}

final class AddToCartSuccess extends AddToCartState {
  final Response response;

  const AddToCartSuccess({required this.response});
}
