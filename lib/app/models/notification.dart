import 'package:cloud_firestore/cloud_firestore.dart';

class Notification {
  final String title;
  final String description;
  final String topic;

  static Notification fromSnapshot(DocumentSnapshot snap) {
    Notification notification = Notification(
      title: snap["title"],
      description: snap["description"],
      topic:  snap["topic"],
    );
    return notification;
  }

  Notification({
    required this.title,
    required this.description,
    required this.topic
  });
}