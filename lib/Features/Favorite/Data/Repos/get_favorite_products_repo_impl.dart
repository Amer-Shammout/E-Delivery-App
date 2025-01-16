import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Core/network/dio_client.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/app_strings.dart';
import 'package:e_delivery_app/Features/Favorite/Data/Repos/get_favorite_products_repo.dart';
import 'package:e_delivery_app/constants.dart';

class GetFavoriteProductsRepoImpl extends GetFavoriteProductsRepo {
  @override
  Future<Either<Failure, List<ProductModel>>> getFavoriteProducts() async {
    try {
      String token = Prefs.getString(kToken);
      Response response =
          await getIt.get<DioClient>().get(kGetFavoriteProductsUrl,
              options: Options(
                headers: {
                  "Authorization": "Bearer $token",
                },
              ));
      dynamic jsonData = response.data;
      List<ProductModel> favoriteProducts = [];
      for (var product in jsonData["favorites"]) {
        favoriteProducts.add(ProductModel.fromJson(product));
      }
      return right(favoriteProducts);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }
}
