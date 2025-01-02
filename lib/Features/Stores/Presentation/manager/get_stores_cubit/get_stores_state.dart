part of 'get_stores_cubit.dart';

sealed class GetStoresState extends Equatable {
  const GetStoresState();

  @override
  List<Object> get props => [];
}

final class GetStoresInitial extends GetStoresState {}

final class GetStoresLoading extends GetStoresState {}

final class GetStoresSuccess extends GetStoresState {
  final List<StoreModel> stores;

  const GetStoresSuccess({required this.stores});
}

final class GetStoresFailure extends GetStoresState {
  final String errMessage;

  const GetStoresFailure({required this.errMessage});
}
