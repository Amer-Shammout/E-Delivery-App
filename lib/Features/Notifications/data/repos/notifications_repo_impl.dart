import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_delivery_app/Core/errors/failures.dart';
import 'package:e_delivery_app/Core/network/dio_client.dart';
import 'package:e_delivery_app/Core/services/service_locator.dart';
import 'package:e_delivery_app/Core/services/shared_preferences_singleton.dart';
import 'package:e_delivery_app/Core/utils/app_strings.dart';
import 'package:e_delivery_app/Features/Notifications/data/models/notifications_model.dart';
import 'package:e_delivery_app/Features/Notifications/data/repos/notifications_repo.dart';
import 'package:e_delivery_app/constants.dart';

class NotificationsRepoImpl extends NotificationsRepo {
  @override
  Future<Either<Failure, List<NotificationsModel>>> getNotifications() async {
    try {
      String token = Prefs.getString(kToken);
      Response response = await getIt.get<DioClient>().get(
            kNotificationsUrl,
            options: Options(headers: {"Authorization": "Bearer $token"}),
          );
      dynamic jsonData = response.data;
      List<NotificationsModel> notifications = [];
      for (var notification in jsonData["Notifications"]) {
        notifications.add(NotificationsModel.fromJson(notification));
      }
      return right(notifications);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }
}
