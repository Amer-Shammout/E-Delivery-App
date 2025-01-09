import 'package:dartz/dartz.dart';
import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';

abstract class GetFavoriteProductsRepo {
  Future<Either<Failure, List<ProductModel>>> getFavoriteProducts();
}
