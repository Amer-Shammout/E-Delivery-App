import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Core/network/dio_client.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/app_strings.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/registeration_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/resend_code_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/setting_info_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_response_model/user.dart';
import 'package:e_delivery_app/Features/Auth/Data/Models/verification_response_model/verification_response_model.dart';
import 'package:e_delivery_app/Features/Auth/Data/repos/auth_repo.dart';
import 'package:e_delivery_app/constants.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, bool>> register(
      RegisterationModel registerModel) async {
    try {
      await getIt
          .get<DioClient>()
          .post(kRegisterUrl, data: registerModel.toJson());
      return right(true);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, bool>> resendCode(
      ResendCodeModel resendOtpModel) async {
    try {
      await getIt
          .get<DioClient>()
          .post(kResendOTPUrl, data: resendOtpModel.toJson());
      return right(true);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, VerificationResponseModel>> verify(
      VerificationModel verificationModel) async {
    try {
      Response response = await getIt
          .get<DioClient>()
          .post(kVerificationUrl, data: verificationModel.toJson());
      dynamic jsonData = response.data;
      VerificationResponseModel data =
          VerificationResponseModel.fromJson(jsonData);
      Prefs.setString(kToken, data.token!);
      Prefs.setString(kId, data.user!.id.toString());
      log("$data");

      return right(data);
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        return left(ServerFailure(errMessage: e.response!.data['message']));
      }
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, User>> settingInfo(SettingInfoModel model) async {
    try {
      String id = Prefs.getString(kId);
      String token = Prefs.getString(kToken);
      Response response = await getIt.get<DioClient>().post(
            '$kUpdateUserUrl/$id',
            data: FormData.fromMap(model.toJson()),
            options: Options(
              headers: {
                "Authorization": "Bearer $token",
                "Content-Type": "multipart/form-data"
              },
            ),
          );
      dynamic jsonData = response.data;
      User user = User.fromJson(jsonData['user']);
      return right(user);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }
}
