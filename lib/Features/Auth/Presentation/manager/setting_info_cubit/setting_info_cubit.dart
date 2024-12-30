import 'package:e_delivery_app/Features/Auth/Data/Models/setting_info_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_response_model/user.dart';
import 'package:e_delivery_app/Features/Auth/Data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_info_state.dart';

class SettingInfoCubit extends Cubit<SettingInfoState> {
  SettingInfoCubit(this._authRepo) : super(SettingInfoInitial());
  final AuthRepo _authRepo;

  Future<void> settingInfo(
      SettingInfoModel model) async {
    emit(SettingInfoLoading());
    var result = await _authRepo.settingInfo(model);
    result.fold(
      (failure) {
        emit(SettingInfoFailure(errMessage: failure.errMessage));
      },
      (user) {
        emit(SettingInfoSuccess(user: user));
      },
    );
  }
}
