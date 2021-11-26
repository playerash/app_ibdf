import 'dart:async';

import 'package:app_ibdf/app/models/events.dart';
import 'package:app_ibdf/app/repository/events/events_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calendario_event.dart';
part 'calendario_state.dart';

class CalendarioBloc extends Bloc<CalendarioEvent, CalendarioState> {

  final EventsRepository _eventsRepository;
  StreamSubscription? _eventsSubscriptions;

  CalendarioBloc({required EventsRepository eventsRepository})
      : _eventsRepository = eventsRepository,
        super(CalendarioLoading()) {

    on<CalendarioEvent>((event, emit) async {

      if (event is LoadCalendario) {
        _eventsSubscriptions?.cancel();
        _eventsSubscriptions = _eventsRepository.getAllEvents().listen(
              (events) => add(
                UpdateCalendario(events),
              ),
            );
      }
      if (event is UpdateCalendario) {
        emit(CalendarioLoaded(events: event.events));
      }
    });
  }
}
