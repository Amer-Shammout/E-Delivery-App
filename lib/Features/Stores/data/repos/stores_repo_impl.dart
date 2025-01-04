import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Core/network/dio_client.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/app_strings.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:e_delivery_app/Features/Stores/data/repos/stores_repo.dart';
import 'package:e_delivery_app/constants.dart';

class StoresRepoImpl extends StoresRepo {
  @override
  Future<Either<Failure, List<StoreModel>>> getStores() async {
    try {
      String token = Prefs.getString(kToken);

      Response response = await getIt.get<DioClient>().get(
            kStores,
            options: Options(
              headers: {"Authorization": "Bearer $token"},
            ),
          );
      List<dynamic> jsonDataStores = response.data['data'];
      List<StoreModel> stores = [];
      for (var store in jsonDataStores) {
        stores.add(StoreModel.fromJson(store));
      }
      return right(stores);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }
}
