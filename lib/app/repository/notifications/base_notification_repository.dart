import 'package:app_ibdf/app/models/notification.dart';

abstract class BaseNotificationRepository {
  Stream<List<Notification>> getAllNotification();
}
