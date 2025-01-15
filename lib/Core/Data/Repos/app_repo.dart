import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Core/Data/Models/user.dart';

abstract class AppRepo {
  Future<Either<Failure, User>> getUser({data});
  Future<Either<Failure, Response>> addOrRemoveFavorites(int productId);
  Future<Either<Failure, Response>> addToCart(int productId);
  Future<Either<Failure, Response>> removeFromCart(int productId);
}
