import 'package:dartz/dartz.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Features/Search/data/models/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, SearchModel>> search({required String q});
}
