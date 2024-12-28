import 'package:bloc/bloc.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/resend_code_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'resend_code_state.dart';

class ResendCodeCubit extends Cubit<ResendCodeState> {
  ResendCodeCubit(this._authRepo) : super(ResendCodeInitial());
  final AuthRepo _authRepo;
  Future<void> resenCode(ResendCodeModel resendOtpModel) async {
    emit(ResendCodeLoading());
    var result = await _authRepo.resendCode(resendOtpModel);
    result.fold(
      (failure) {
        emit(ResendCodeFailure(errMessage: failure.errMessage));
      },
      (flag) {
        emit(ResendCodeSuccess());
      },
    );
  }
}
