part of 'calendario_bloc.dart';

abstract class CalendarioState extends Equatable {
  const CalendarioState();

  @override
  List<Object> get props => [];
}

class CalendarioLoading extends CalendarioState {}

class CalendarioLoaded extends CalendarioState {
  final List<Events> events;

  CalendarioLoaded({this.events = const <Events>[]});
  @override
  List<Object> get props => [events];
}
