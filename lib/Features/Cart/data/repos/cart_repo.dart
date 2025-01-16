import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_item_quantity/cart_item_quantity.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_model.dart';
import 'package:e_delivery_app/Features/Orders/Data/order_model/order_model.dart';

abstract class CartRepo {
  Future<Either<Failure, CartModel?>> getCart();
  Future<Either<Failure, Response>> updateCart(CartItemQuantity cart);
  Future<Either<Failure, OrderModel>> submitTheOrder();
}
