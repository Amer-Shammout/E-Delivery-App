part of 'get_cart_cubit.dart';

sealed class GetCartState extends Equatable {
  const GetCartState();

  @override
  List<Object> get props => [];
}

final class GetCartInitial extends GetCartState {}

final class GetCartEmpty extends GetCartState {}

final class GetCartLoading extends GetCartState {}

final class GetCartSuccess extends GetCartState {
  final CartModel? cartModel;

  const GetCartSuccess({required this.cartModel});
}

final class GetCartFailure extends GetCartState {
  final String errMessage;

  const GetCartFailure({required this.errMessage});
}
