import 'package:app_ibdf/app/models/notification.dart';
import 'package:app_ibdf/app/repository/notifications/base_notification_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationRepository extends BaseNotificationRepository {
  FirebaseFirestore _firebaseFirestore;
  NotificationRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<Notification>> getAllNotification() {
    return _firebaseFirestore
        .collection("notification")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Notification.fromSnapshot(doc))
          .toList();
    });
  }
}
