import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Features/Orders/Data/models/order_model/order_model.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderModel>>> getOrders({required String sort,required String type});
  Future<Either<Failure, Response>> cancelOrder(int id);
}
