import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/Data/Repos/app_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'remove_from_cart_state.dart';

class RemoveFromCartCubit extends Cubit<RemoveFromCartState> {
  RemoveFromCartCubit(this._appRepo) : super(RemoveFromCartInitial());

  final AppRepo _appRepo;

  Future<void> removeFromCart(int productId) async {
    emit(RemoveFromCartLoading());
    var result = await _appRepo.addOrRemoveFavorites(productId);
    result.fold(
      (failure) {
        emit(
          RemoveFromCartFailure(
            errMessage: failure.errMessage,
          ),
        );
      },
      (response) {
        emit(
          RemoveFromCartSuccess(
            response: response,
          ),
        );
      },
    );
  }
}
