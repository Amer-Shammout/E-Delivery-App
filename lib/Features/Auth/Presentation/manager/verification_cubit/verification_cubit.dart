import 'package:bloc/bloc.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_response_model/verification_response_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit(this._authRepo) : super(VerificationInitial());
  final AuthRepo _authRepo;

  Future<void> verify(VerificationModel verificationModel) async {
    emit(VerificationLoading());
    var result = await _authRepo.verify(verificationModel);
    result.fold(
      (failure) {
        emit(
          VerificationFailure(errMessage: failure.errMessage),
        );
      },
      (verificationResponseModel) {
        emit(
          VerificationSuccess(
              verificationResponseModel: verificationResponseModel),
        );
        Prefs.setString('id', verificationResponseModel.user!.id.toString());
        Prefs.setString('token', verificationResponseModel.token!);
      },
    );
  }
}
