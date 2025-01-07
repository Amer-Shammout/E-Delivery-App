import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Core/network/dio_client.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/app_strings.dart';
import 'package:e_delivery_app/Features/Search/data/models/search_model.dart';
import 'package:e_delivery_app/Features/Search/data/repos/search_repo.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:e_delivery_app/constants.dart';

class SearchRepoImpl extends SearchRepo {
  @override
  Future<Either<Failure, SearchModel>> search({required String q}) async {
    try {
      String token = Prefs.getString(kToken);
      Response response = await getIt.get<DioClient>().get(
            kSearchUrl + q,
            options: Options(headers: {"Authorization": "Bearer $token"}),
          );
      dynamic jsonData = response.data;
      List<ProductModel> products = [];
      List<StoreModel> stores = [];
      for (var product in jsonData["products"]) {
        products.add(ProductModel.fromJson(product));
      }
      for (var store in jsonData["stores"]) {
        stores.add(StoreModel.fromJson(store));
      }
      return right(
        SearchModel(
          products: products,
          stores: stores,
        ),
      );
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }
}
