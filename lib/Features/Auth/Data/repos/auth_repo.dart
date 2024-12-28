import 'package:dartz/dartz.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/registeration_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/resend_otp_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_response_model/verification_response_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> register(RegisterationModel registerModel);
  Future<Either<Failure, VerificationResponseModel>> verify(
      VerificationModel verificationModel);
  Future<Either<Failure, bool>> resendCode(ResendOtpModel resendOTPModel);
  // Future<Either<Failure,String>> settingInfo(String phoneNumber); //TODO
}
