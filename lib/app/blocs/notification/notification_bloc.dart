import 'dart:async';

import 'package:app_ibdf/app/models/notification.dart';
import 'package:app_ibdf/app/repository/notifications/notification_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {

  final NotificationRepository _notificationRepository;
  StreamSubscription? _notificationSubscription;

  NotificationBloc({required NotificationRepository notificationRepository})
      : _notificationRepository = notificationRepository,
        super(NotificationLoading()) {

    on<NotificationEvent>((event, emit) async {

      if (event is LoadNotifications) {
        _notificationSubscription?.cancel();
        _notificationSubscription =
            _notificationRepository.getAllNotification().listen(
                  (notifications) => add(
                    UpdateNotification(notifications),
                  ),
                );
      }
      if (event is UpdateNotification) {
        emit(NotificationLoaded(notifications: event.notifications));
      }
    });
  }
}
