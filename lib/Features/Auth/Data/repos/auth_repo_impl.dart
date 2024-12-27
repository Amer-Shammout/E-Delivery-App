import 'package:dartz/dartz.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/registeration_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_response_model/verification_response_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, String>> register(RegisterationModel registerModel) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> resendCode(String phoneNumber) {
    // TODO: implement resendCode
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, VerificationResponseModel>> verify(VerificationModel verificationModel) {
    // TODO: implement verify
    throw UnimplementedError();
  }

}