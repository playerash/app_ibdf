part of 'perguntas_bloc.dart';

abstract class PerguntasEvent extends Equatable {
  const PerguntasEvent();

  @override
  List<Object> get props => [];
}

class LoadPerguntas extends PerguntasEvent {}

class UpdatePerguntas extends PerguntasEvent {
  final PerguntaDoDia perguntaDoDia;

  UpdatePerguntas(this.perguntaDoDia);

  @override
  List<Object> get props => [perguntaDoDia];
}
