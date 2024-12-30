import 'package:dio/dio.dart';
import 'package:e_delivery_app/Features/Profile/data/repos/profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._profileRepo) : super(LogoutInitial());

  final ProfileRepo _profileRepo;

  logout() async {
    emit(LogoutLoading());
    var result = await _profileRepo.logout();
    result.fold((failure) {
      emit(LogoutFailure(errMessage: failure.errMessage));
    }, (response) {
      emit(LogoutSuccess(response: response));
    });
  }
}
