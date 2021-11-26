import 'package:app_ibdf/app/models/events.dart';

abstract class BaseEventsRepository {
  Stream<List<Events>> getAllEvents();
}
