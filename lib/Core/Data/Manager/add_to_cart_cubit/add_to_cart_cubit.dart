import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/Data/Repos/app_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this._appRepo) : super(AddToCartInitial());

  final AppRepo _appRepo;

  Future<void> addToCart(int productId) async {
    emit(AddToCartLoading());
    var result = await _appRepo.addOrRemoveFavorites(productId);
    result.fold(
      (failure) {
        emit(
          AddToCartFailure(
            errMessage: failure.errMessage,
          ),
        );
      },
      (response) {
        emit(
          AddToCartSuccess(
            response: response,
          ),
        );
      },
    );
  }
}
