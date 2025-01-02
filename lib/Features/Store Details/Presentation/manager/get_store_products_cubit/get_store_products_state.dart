part of 'get_store_products_cubit.dart';

sealed class GetStoreProductsState extends Equatable {
  const GetStoreProductsState();

  @override
  List<Object> get props => [];
}

final class GetStoreProductsInitial extends GetStoreProductsState {}

final class GetStoreProductsLoading extends GetStoreProductsState {}

final class GetStoreProductsFailure extends GetStoreProductsState {
  final String errMessage;

  const GetStoreProductsFailure({required this.errMessage});
}

final class GetStoreProductsSuccess extends GetStoreProductsState {
  final List<ProductModel> products;

  const GetStoreProductsSuccess({required this.products});
}
