import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Features/Store%20Details/data/repos/store_details_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_store_products_state.dart';

class GetStoreProductsCubit extends Cubit<GetStoreProductsState> {
  GetStoreProductsCubit(this._storeDetailsRepo)
      : super(GetStoreProductsInitial());

  final StoreDetailsRepo _storeDetailsRepo;

  Future<void> getStoreProducts(
      {required int storeId, required String category}) async {
    if (!isClosed) {
      emit(GetStoreProductsLoading());
    }
    var result = await _storeDetailsRepo.getStoreProducts(
        storeId: storeId, category: category);
    result.fold((failure) {
      emit(GetStoreProductsFailure(errMessage: failure.errMessage));
    }, (products) {
      if (!isClosed) {
        emit(GetStoreProductsSuccess(products: products));
      }
    });
  }
}
