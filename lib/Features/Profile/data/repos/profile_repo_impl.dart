import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Core/network/dio_client.dart';
import 'package:e_delivery_app/Core/services/firebase_notification.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/app_strings.dart';
import 'package:e_delivery_app/Features/Profile/data/repos/profile_repo.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:location/location.dart';

class ProfileRepoImpl extends ProfileRepo {
  @override
  Future<Either<Failure, Response>> updateLocation(
      LocationData newLocation) async {
    String id = Prefs.getString(kId);
    String token = Prefs.getString(kToken);
    try {
      Response response = await getIt.get<DioClient>().put(
            '$kUpdateUserUrl/$id',
            data: {
              'latitude': newLocation.latitude,
              'longitude': newLocation.longitude,
            },
            options: Options(
              headers: {
                "Authorization": "Bearer $token",
              },
            ),
          );
      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, Response>> updateName(String newName) async {
    String id = Prefs.getString(kId);
    String token = Prefs.getString(kToken);
    try {
      Response response = await getIt.get<DioClient>().put(
            '$kUpdateUserUrl/$id',
            data: {
              'full_name': newName,
            },
            options: Options(
              headers: {
                "Authorization": "Bearer $token",
              },
            ),
          );
      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, Response>> updateProfileImage(String newImage) async {
    String id = Prefs.getString(kId);
    String token = Prefs.getString(kToken);
    try {
      Response response = await getIt.get<DioClient>().post(
            '$kUpdateUserUrl/$id',
            data: FormData.fromMap({
              '_method': 'PUT',
              'image': await MultipartFile.fromFile(newImage)
            }),
            options: Options(
              headers: {
                "Authorization": "Bearer $token",
                "Content-Type": "multipart/form-data"
              },
            ),
          );
      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, Response>> logout() async {
    String token = Prefs.getString(kToken);
    String fcmToken = FirebaseNotification.fcmToken ?? 'no token';
    try {
      Response response = await getIt.get<DioClient>().post(
            kLogoutUrl,
            data: {"fcm_token": fcmToken},
            options: Options(
              headers: {
                "Authorization": "Bearer $token",
              },
            ),
          );
      Prefs.removePref(kToken);
      Prefs.removePref(kId);
      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, Response>> updatePhoneNumber(String newPhoneNumber) {
    throw UnimplementedError();
  }
}
