import 'package:e_delivery_app/Features/Store%20Details/data/repos/store_details_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_store_categories_state.dart';

class GetStoreCategoriesCubit extends Cubit<GetStoreCategoriesState> {
  GetStoreCategoriesCubit(this._storeDetailsRepo)
      : super(GetStoreCategoriesInitial());
  final StoreDetailsRepo _storeDetailsRepo;

  void getStoreCategories(int storeId) async {
    emit(GetStoreCategoriesLoading());
    var result = await _storeDetailsRepo.getStoreCategories(storeId);
    result.fold((failure) {
      emit(GetStoreCategoriesFailure(errMessage: failure.errMessage));
    }, (storeCategories) {
      emit(GetStoreCategoriesSuccess(storeCategories: storeCategories));
    });
  }
}
