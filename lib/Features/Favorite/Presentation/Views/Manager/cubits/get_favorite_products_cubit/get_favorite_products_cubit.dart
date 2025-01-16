import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Features/Favorite/Data/Repos/get_favorite_products_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_favorite_products_state.dart';

class GetFavoriteProductsCubit extends Cubit<GetFavoriteProductsState> {
  GetFavoriteProductsCubit(this._getFavoriteProductsRepo)
      : super(GetFavoriteProductsInitial());
  final GetFavoriteProductsRepo _getFavoriteProductsRepo;

  List<ProductModel> products = [];

  Future<void> getFavoriteProducts() async {
    emit(GetFavoriteProductsLoading());
    var result = await _getFavoriteProductsRepo.getFavoriteProducts();
    result.fold(
      (failure) {
        emit(GetFavoriteProductsFailure(errMessage: failure.errMessage));
      },
      (favoriteProducts) {
        if (favoriteProducts.isEmpty) {
          emit(GetFavoriteProductsEmpty());
        } else {
          products = favoriteProducts;
          emit(GetFavoriteProductsSuccess(favoriteProducts: favoriteProducts));
        }
      },
    );
  }
}
