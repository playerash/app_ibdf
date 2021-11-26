part of 'versiculododia_bloc.dart';

abstract class VersiculoDoDiaState extends Equatable {
  const VersiculoDoDiaState();

  @override
  List<Object> get props => [];
}

class VersiculododiaLoading extends VersiculoDoDiaState {}

class VersiculoDoDiaLoaded extends VersiculoDoDiaState {
  final VersiculoDoDia versiculoDoDia;

  VersiculoDoDiaLoaded(this.versiculoDoDia);
  @override
  List<Object> get props => [versiculoDoDia];
}
