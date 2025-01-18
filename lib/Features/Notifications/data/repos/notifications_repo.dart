import 'package:dartz/dartz.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Features/Notifications/data/models/notifications_model.dart';

abstract class NotificationsRepo {
  Future<Either<Failure, List<NotificationsModel>>> getNotifications();
}
