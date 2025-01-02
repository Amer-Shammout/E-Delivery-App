import 'package:e_delivery_app/Core/Data/Models/user.dart';
import 'package:e_delivery_app/Core/Data/Repos/app_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit(this._appRepo) : super(GetUserInitial());
  final AppRepo _appRepo;
  User? user;

  Future<void> getUser() async {
    emit(GetUserLoading());
    var result = await _appRepo.getUser();
    result.fold(
      (failure) {
        emit(GetUserFailure(errMessage: failure.errMessage));
      },
      (getUser) {
        emit(GetUserSuccess());
        user = getUser;
      },
    );
  }
}
