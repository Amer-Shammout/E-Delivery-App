import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/Data/Repos/app_repo.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Core/network/dio_client.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/app_strings.dart';
import 'package:e_delivery_app/Core/Data/Models/user.dart';
import 'package:e_delivery_app/constants.dart';

class AppRepoImpl extends AppRepo {
  @override
  Future<Either<Failure, User>> getUser({data}) async {
    try {
      String userId = Prefs.getString(kId);
      String token = Prefs.getString(kToken);
      Response response = await getIt.get<DioClient>().put(
            '$kUpdateUserUrl/$userId',
            data: data ?? {},
            options: Options(
              headers: {
                "Authorization": "Bearer $token",
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

  @override
  Future<Either<Failure, Response>> addOrRemoveFavorites(int productId) async {
    try {
      String token = Prefs.getString(kToken);
      Response response =
          await getIt.get<DioClient>().post(kAddOrRemoveFavoritesUrl,
              options: Options(
                headers: {
                  "Authorization": "Bearer $token",
                },
              ),
              data: {"product_id": productId});

      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, Response>> addToCart(int productId) async {
    try {
      String token = Prefs.getString(kToken);
      Response response = await getIt.get<DioClient>().post(kAddToCartUrl,
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
            },
          ),
          data: {"product_id": productId});

      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, Map<String,dynamic>>> removeFromCart(int productId) async {
    try {
      String token = Prefs.getString(kToken);
      Map<String,dynamic> response =
          await getIt.get<DioClient>().delete(kRemoveFromCartUrl,
              options: Options(
                headers: {
                  "Authorization": "Bearer $token",
                },
              ),
              data: {"product_id": productId});

      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }
}
