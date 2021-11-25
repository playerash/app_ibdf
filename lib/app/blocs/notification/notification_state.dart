part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<Notification> notifications;
  NotificationLoaded({this.notifications = const <Notification>[]});

    @override
  List<Object> get props => [notifications];
}
