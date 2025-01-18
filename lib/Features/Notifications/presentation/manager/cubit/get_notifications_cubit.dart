import 'package:e_delivery_app/Features/Notifications/data/models/notifications_model.dart';
import 'package:e_delivery_app/Features/Notifications/data/repos/notifications_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_notifications_state.dart';

class GetNotificationsCubit extends Cubit<GetNotificationsState> {
  GetNotificationsCubit(this._notificationsRepo)
      : super(GetNotificationsInitial());

  final NotificationsRepo _notificationsRepo;

  Future<void> getNotifications() async {
    emit(GetNotificationsLoading());
    var result = await _notificationsRepo.getNotifications();
    result.fold((failure) {
      emit(GetNotificationsFailure(errMessage: failure.errMessage));
    }, (notifications) {
      if (notifications.isEmpty) {
        emit(GetNotificationsEmpty());
      } else {
        emit(GetNotificationsSuccess(notifications: notifications));
      }
    });
  }
}
