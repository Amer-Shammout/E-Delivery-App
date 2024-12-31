import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:location/location.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Response>> updateName(String newName);
  Future<Either<Failure, Response>> updateProfileImage(String newImage);
  Future<Either<Failure, Response>> updateLocation(LocationData newLocation);
  Future<Either<Failure, Response>> updatePhoneNumber(String newPhoneNumber);
  Future<Either<Failure, Response>> logout();
}
