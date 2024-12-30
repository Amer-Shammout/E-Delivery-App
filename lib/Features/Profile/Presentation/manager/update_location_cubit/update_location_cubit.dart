import 'package:dio/dio.dart';
import 'package:e_delivery_app/Features/Profile/data/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

part 'update_location_state.dart';

class UpdateLocationCubit extends Cubit<UpdateLocationState> {
  UpdateLocationCubit(this._profileRepo) : super(UpdateLocationInitial());

  final ProfileRepo _profileRepo;

  updateLocation(LocationData newLocation) async {
    emit(UpdateLocationLoading());
    var result = await _profileRepo.updateLocation(newLocation);
    result.fold((failure) {
      emit(
        UpdateLocationFailure(errMessage: failure.errMessage),
      );
    }, (response) {
      emit(
        UpdateLocationSuccess(response: response),
      );
    });
  }
}
