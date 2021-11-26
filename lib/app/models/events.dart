import 'package:cloud_firestore/cloud_firestore.dart';

class Events {
  final String title;
  final String local;
  final int day;
  final int month;
  final int year;

  static Events fromSnapshot(DocumentSnapshot snap) {
    return Events(
      title: snap["title"],
      local: snap["local"],
      day: snap["day"],
      month: snap["month"],
      year: snap["year"],
    );
  }

  DateTime fromDateTime(Events events) {
    return DateTime.utc(events.year, events.month, events.day);
  }

  Events({
    required this.title,
    required this.local,
    required this.day,
    required this.month,
    required this.year,
  });
}
