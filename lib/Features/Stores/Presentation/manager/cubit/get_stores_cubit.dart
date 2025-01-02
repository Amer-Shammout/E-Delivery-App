import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:e_delivery_app/Features/Stores/data/repos/stores_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_stores_state.dart';

class GetStoresCubit extends Cubit<GetStoresState> {
  GetStoresCubit(this._storesRepo) : super(GetStoresInitial());

  final StoresRepo _storesRepo;

  void getStores() async {
    emit(GetStoresLoading());
    var result = await _storesRepo.getStores();
    result.fold((failure) {
      emit(GetStoresFailure(errMessage: failure.errMessage));
    }, (stores) {
      emit(GetStoresSuccess(stores: stores));
    });
  }
}
