import 'dart:async';

import 'package:app_ibdf/app/models/pergunta_do_dia.dart';
import 'package:app_ibdf/app/repository/perguntas/perguntas_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'perguntas_event.dart';
part 'perguntas_state.dart';

class PerguntasBloc extends Bloc<PerguntasEvent, PerguntasState> {
  final PerguntasRepository _perguntasRepository;
  StreamSubscription? _perguntasSubscription;

  PerguntasBloc({required PerguntasRepository perguntasRepository})
      : _perguntasRepository = perguntasRepository,
        super(PerguntasLoading()) {
    on<PerguntasEvent>((event, emit) {
      if (event is LoadPerguntas) {
        _perguntasSubscription?.cancel();
        _perguntasSubscription = _perguntasRepository.getPergunta().listen(
              (pergunta) => add(
                UpdatePerguntas(pergunta),
              ),
            );
      }
      if (event is UpdatePerguntas) {
        emit(
          PerguntasLoaded(event.perguntaDoDia),
        );
      }
    });
  }
}
