import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Core/network/dio_client.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/app_strings.dart';
import 'package:e_delivery_app/Features/Store%20Details/data/repos/store_details_repo.dart';
import 'package:e_delivery_app/constants.dart';

class StoreDetailsRepoImpl extends StoreDetailsRepo {
  @override
  Future<Either<Failure, List<dynamic>>> getStoreCategories(int storeId) async {
    try {
      String token = Prefs.getString(kToken);
      Response response = await getIt.get<DioClient>().get(
            '$kStoresUrl/$storeId/$kCategories',
            options: Options(
              headers: {
                "Authorization": "Bearer $token",
              },
            ),
          );
      List<dynamic> productCategories = response.data;
      return right(productCategories);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getStoreProducts(
      {required int storeId, required String category}) async {
    try {
      String token = Prefs.getString(kToken);
      Response response = await getIt.get<DioClient>().get(
            '$kStoresUrl/$storeId/$kCategories/$category',
            options: Options(
              headers: {
                "Authorization": "Bearer $token",
              },
            ),
          );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> productsJsonData = jsonData['data'];
      List<ProductModel> products = [];
      for (var product in productsJsonData) {
        products.add(ProductModel.fromJson(product));
      }
      products.shuffle();
      return right(products);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }
}
