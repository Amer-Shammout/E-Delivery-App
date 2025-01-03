import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Features/Home/Data/Repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_products_by_category_state.dart';

class GetProductsByCategoryCubit extends Cubit<GetProductsByCategoryState> {
  GetProductsByCategoryCubit(this._homeRepo)
      : super(GetProductsByCategoryInitial());
  final HomeRepo _homeRepo;
  Future<void> getProductsByCategory(String category) async {
    emit(GetProductsByCategoryLoading());
    var result = await _homeRepo.getProductByCategory(category);
    result.fold(
      (failure) {
        emit(GetProductsByCategoryFailure(errMessage: failure.errMessage));
      },
      (products) {
        emit(GetProductsByCategorySuccess(products: products));
      },
    );
  }
}
