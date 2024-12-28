import 'package:e_delivery_app/Features/Auth/Data/Models/registeration_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepo) : super(RegisterInitial());

  final AuthRepo _authRepo;

  Future<void> register(RegisterationModel registerModel) async {
    emit(RegisterLoading());
    var result = await _authRepo.register(registerModel);

    result.fold((failure) {
      emit(RegisterFailure(errMessage: failure.errMessage));
    }, (flag) {
      emit(RegisterSuccess());
    });
  }
}
