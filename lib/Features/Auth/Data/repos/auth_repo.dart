import 'package:dartz/dartz.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/registeration_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/resend_code_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/setting_info_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_model.dart';
import 'package:e_delivery_app/Core/Data/Models/user.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_response_model/verification_response_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> register(RegistrationModel registerModel);
  Future<Either<Failure, VerificationResponseModel>> verify(
      VerificationModel verificationModel);
  Future<Either<Failure, bool>> resendCode(ResendCodeModel resendOtpModel);
  Future<Either<Failure, User>> settingInfo(SettingInfoModel model);
}
