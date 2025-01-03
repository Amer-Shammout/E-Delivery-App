import 'package:dartz/dartz.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Core/Data/Models/user.dart';

abstract class AppRepo {
  Future<Either<Failure, User>> getUser();
}
