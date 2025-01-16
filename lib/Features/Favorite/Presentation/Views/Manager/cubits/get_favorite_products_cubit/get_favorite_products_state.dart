part of 'get_favorite_products_cubit.dart';

sealed class GetFavoriteProductsState extends Equatable {
  const GetFavoriteProductsState();

  @override
  List<Object> get props => [];
}

final class GetFavoriteProductsInitial extends GetFavoriteProductsState {}

final class GetFavoriteProductsEmpty extends GetFavoriteProductsState {}

final class GetFavoriteProductsLoading extends GetFavoriteProductsState {}

final class GetFavoriteProductsSuccess extends GetFavoriteProductsState {
  final List<ProductModel> favoriteProducts;

  const GetFavoriteProductsSuccess({required this.favoriteProducts});
}

final class GetFavoriteProductsFailure extends GetFavoriteProductsState {
  final String errMessage;

  const GetFavoriteProductsFailure({required this.errMessage});
}
