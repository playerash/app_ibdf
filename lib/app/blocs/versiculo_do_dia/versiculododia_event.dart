part of 'versiculododia_bloc.dart';

abstract class VersiculoDoDiaEvent extends Equatable {
  const VersiculoDoDiaEvent();

  @override
  List<Object> get props => [];
}

class LoadVersiculododia extends VersiculoDoDiaEvent {}

class UpdateVersiculododia extends VersiculoDoDiaEvent {
  final VersiculoDoDia versiculoDoDia;
  UpdateVersiculododia(this.versiculoDoDia);
  @override
  List<Object> get props => [versiculoDoDia];
}
