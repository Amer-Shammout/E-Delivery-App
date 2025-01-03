import 'package:dartz/dartz.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getProductByCategory(
      String category);
  Future<Either<Failure, List<ProductModel>>> getOffers();
  Future<Either<Failure, List<dynamic>>> getCategories();
}
