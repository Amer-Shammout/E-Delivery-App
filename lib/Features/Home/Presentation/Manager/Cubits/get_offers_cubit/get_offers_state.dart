part of 'get_offers_cubit.dart';

sealed class GetOffersState extends Equatable {
  const GetOffersState();

  @override
  List<Object> get props => [];
}

final class GetOffersInitial extends GetOffersState {}

final class GetOffersLoading extends GetOffersState {}

final class GetOffersSuccess extends GetOffersState {
  final List<ProductModel> offers;

  const GetOffersSuccess({required this.offers});
}

final class GetOffersFailure extends GetOffersState {
  final String errMessage;

  const GetOffersFailure({required this.errMessage});
}
