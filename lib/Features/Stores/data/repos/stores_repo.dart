import 'package:dartz/dartz.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';

abstract class StoresRepo {
  Future<Either<Failure, List<StoreModel>>> getStores();
}
