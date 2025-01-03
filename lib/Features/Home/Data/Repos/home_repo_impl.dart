import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Core/network/dio_client.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/app_strings.dart';
import 'package:e_delivery_app/Features/Home/Data/Repos/home_repo.dart';
import 'package:e_delivery_app/constants.dart';

class HomeRepoImpl extends HomeRepo {
  String token;

  HomeRepoImpl({required this.token});

  @override
  Future<Either<Failure, List<ProductModel>>> getOffers() {
    // TODO: implement getOffers
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductByCategory(
      String category) async {
    try {
      token = Prefs.getString(kToken);
      Response response = await getIt.get<DioClient>().get(
            kGetProductsByCategories + category,
            options: Options(headers: {"Authorization": "Bearer $token"}),
          );
      dynamic jsonData = response.data;
      List<ProductModel> products = [];
      for (var product in jsonData["data"]) {
        products.add(ProductModel.fromJson(product));
      }
      return right(products);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }
}
