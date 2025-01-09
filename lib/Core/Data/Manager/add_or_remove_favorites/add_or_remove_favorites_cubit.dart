import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/Data/Repos/app_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_or_remove_favorites_state.dart';

class AddOrRemoveFavoritesCubit extends Cubit<AddOrRemoveFavoritesState> {
  AddOrRemoveFavoritesCubit(this._appRepo)
      : super(AddOrRemoveFavoritesInitial());
  final AppRepo _appRepo;

  Future<void> addOrRemoveFavorites(int productId) async {
    emit(AddOrRemoveFavoritesLoading());
    var result = await _appRepo.addOrRemoveFavorites(productId);
    result.fold(
      (failure) {
        emit(AddOrRemoveFavoritesFailure(errMessage: failure.errMessage));
      },
      (response) {
        emit(AddOrRemoveFavoritesSuccess(response: response));
      },
    );
  }
}
