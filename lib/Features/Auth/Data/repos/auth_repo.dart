import 'package:dartz/dartz.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/registeration_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_response_model/verification_response_model.dart';

abstract class AuthRepo {
  Future<Either<Failure,String>> register(RegisterationModel registerModel);
  Future<Either<Failure,VerificationResponseModel>> verify(VerificationModel verificationModel);
  Future<Either<Failure,String>> resendCode(String phoneNumber);
  // Future<Either<Failure,String>> settingInfo(String phoneNumber); //TODO
}