import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Core/network/dio_client.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/app_strings.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/cart_item_quantity.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_model.dart';
import 'package:e_delivery_app/Features/Cart/data/repos/cart_repo.dart';
import 'package:e_delivery_app/constants.dart';

class CartRepoImpl extends CartRepo {
  @override
  Future<Either<Failure, CartModel?>> getCart() async {
    try {
      String token = Prefs.getString(kToken);
      Response response = await getIt.get<DioClient>().get(
            kCartUrl,
            options: Options(headers: {"Authorization": "Bearer $token"}),
          );
      List<dynamic> orderDetails = response.data['order_details'];
      if (orderDetails.isEmpty) {
        log("${response.data['order_details']}");
        return right(null);
      }
      Map<String, dynamic> jsonData = orderDetails[0];
      log("${jsonData}");

      CartModel cartModel = CartModel.fromJson(jsonData);
      return right(cartModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, Response>> updateCart(CartItemQuantity cart) async {
    try {
      String token = Prefs.getString(kToken);
      Response response = await getIt.get<DioClient>().put(kUpdateCartUrl,
          options: Options(headers: {"Authorization": "Bearer $token"}),
          data: cart.toJson());

      return right(response);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }
}
