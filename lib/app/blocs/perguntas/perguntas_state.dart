part of 'perguntas_bloc.dart';

abstract class PerguntasState extends Equatable {
  const PerguntasState();

  @override
  List<Object> get props => [];
}

class PerguntasLoading extends PerguntasState {}

class PerguntasLoaded extends PerguntasState {
  final PerguntaDoDia perguntaDoDia;

  PerguntasLoaded(this.perguntaDoDia);

  @override
  List<Object> get props => [perguntaDoDia];
}
