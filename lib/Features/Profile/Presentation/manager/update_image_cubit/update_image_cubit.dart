import 'package:dio/dio.dart';
import 'package:e_delivery_app/Features/Profile/data/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_image_state.dart';

class UpdateImageCubit extends Cubit<UpdateImageState> {
  UpdateImageCubit(this._profileRepo) : super(UpdateImageInitial());

  final ProfileRepo _profileRepo;

  updateName(String newName) async {
    emit(UpdateImageLoading());
    var result = await _profileRepo.updateName(newName);
    result.fold((failure) {
      emit(
        UpdateImageFailure(errMessage: failure.errMessage),
      );
    }, (response) {
      emit(
        UpdateImageSuccess(response: response),
      );
    });
  }
}
