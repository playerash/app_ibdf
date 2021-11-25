part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class LoadNotifications extends NotificationEvent {}

class UpdateNotification extends NotificationEvent {
  final List<Notification> notifications;
  UpdateNotification(this.notifications);

  @override
  List<Object> get props => [notifications];

}
