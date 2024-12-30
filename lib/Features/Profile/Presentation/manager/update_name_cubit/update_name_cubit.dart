import 'package:dio/dio.dart';
import 'package:e_delivery_app/Features/Profile/data/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_name_state.dart';

class UpdateNameCubit extends Cubit<UpdateNameState> {
  UpdateNameCubit(this._profileRepo) : super(UpdateNameInitial());

  final ProfileRepo _profileRepo;

  updateName(String newName) async {
    emit(UpdateNameLoading());
    var result = await _profileRepo.updateName(newName);
    result.fold((failure) {
      emit(
        UpdateNameFailure(errMessage: failure.errMessage),
      );
    }, (response) {
      emit(
        UpdateNameSuccess(response: response),
      );
    });
  }
}
