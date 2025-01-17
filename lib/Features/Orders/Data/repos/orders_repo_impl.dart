import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Core/network/dio_client.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/app_strings.dart';
import 'package:e_delivery_app/Features/Orders/Data/models/order_model/order_model.dart';
import 'package:e_delivery_app/Features/Orders/Data/repos/orders_repo.dart';
import 'package:e_delivery_app/constants.dart';

class OrdersRepoImpl extends OrdersRepo {
  @override
  Future<Either<Failure, List<OrderModel>>> getOrders(
      {required String sort, required String type}) async {
    try {
      String token = Prefs.getString(kToken);
      Response response = await getIt.get<DioClient>().get(
            sort != '' ? '$kOrdersUrl?sort=$sort' : '$kOrdersUrl?status=$type',
            options: Options(headers: {"Authorization": "Bearer $token"}),
          );
      Map<String, dynamic> jsonData = response.data;
      if (jsonData['message'] != null) {
        return right([]);
      }
      List<dynamic> ordersJson = jsonData['orders'];
      List<OrderModel> orders = [];
      for (var order in ordersJson) {
        orders.add(OrderModel.fromJson(order));
      }
      // products.shuffle();
      return right(orders);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }
}
