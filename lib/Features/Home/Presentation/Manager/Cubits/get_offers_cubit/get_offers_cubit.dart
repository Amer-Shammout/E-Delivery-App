import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Features/Home/Data/Repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_offers_state.dart';

class GetOffersCubit extends Cubit<GetOffersState> {
  GetOffersCubit(this._homeRepo) : super(GetOffersInitial());
  final HomeRepo _homeRepo;
  Future<void> getOffers() async {
    emit(GetOffersLoading());
    var result = await _homeRepo.getOffers();
    result.fold(
      (failure) {
        emit(GetOffersFailure(errMessage: failure.errMessage));
      },
      (offers) {
        emit(GetOffersSuccess(offers: offers));
      },
    );
  }
}
