import 'package:app_ibdf/app/models/events.dart';
import 'package:app_ibdf/app/repository/events/base_events_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventsRepository extends BaseEventsRepository {
  FirebaseFirestore _firebaseFirestore;
  EventsRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Events>> getAllEvents() {
    return _firebaseFirestore
        .collection("calendario")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
      .map((doc) => Events.fromSnapshot(doc)).toList();
    });
  }
}
