import 'package:dartz/dartz.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Features/Cart/data/models/cart_model/cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, CartModel?>> getCart();
}
