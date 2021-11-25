
import 'package:cloud_firestore/cloud_firestore.dart';

class Notification {
  final String title;
  final String description;

  static Notification fromSnapshot(DocumentSnapshot snap) {
    Notification notification = Notification(
      title: snap["title"],
      description: snap["description"],
    );
    return notification;
  }

  Notification({
    required this.title,
    required this.description,
  });
}

List<Notification> notifications = [
  Notification(
    title: "Culto Terça",
    description: "Venha para o culto",
  ),
  Notification(
    title: "Culto Segunda",
    description: "Venha para o culto",
  ),
  Notification(
    title: "Culto Quinta",
    description: "Venha para o culto",
  ),
  Notification(
    title: "Culto Sábado",
    description: "Venha para o culto",
  ),
  Notification(
    title: "Culto Terça",
    description: "Venha para o culto",
  ),
];
