part of 'calendario_bloc.dart';

abstract class CalendarioEvent extends Equatable {
  const CalendarioEvent();

  @override
  List<Object> get props => [];
}

class LoadCalendario extends CalendarioEvent {}

class UpdateCalendario extends CalendarioEvent {
  final List<Events> events;
  UpdateCalendario(this.events);
  @override
  List<Object> get props => [events];
}
