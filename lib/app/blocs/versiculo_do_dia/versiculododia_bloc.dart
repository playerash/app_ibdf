import 'dart:async';
import 'package:app_ibdf/app/models/versiculo_do_dia.dart';
import 'package:app_ibdf/app/repository/versiculo_do_dia/versiculo_do_dia_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'versiculododia_event.dart';
part 'versiculododia_state.dart';

class VersiculoDoDiaBloc
    extends Bloc<VersiculoDoDiaEvent, VersiculoDoDiaState> {
  final VersiculoDoDiaRepository _versiculoDoDiaRepository;
  StreamSubscription? _versiculoDoDiaSubscription;

  VersiculoDoDiaBloc(
      {required VersiculoDoDiaRepository versiculoDoDiaRepository})
      : _versiculoDoDiaRepository = versiculoDoDiaRepository,
        super(VersiculododiaLoading()) {
    on<VersiculoDoDiaEvent>((event, emit) async {
      if (event is LoadVersiculododia) {
        _versiculoDoDiaSubscription?.cancel();
        _versiculoDoDiaSubscription =
            _versiculoDoDiaRepository.getAllVersiculos().listen(
                  (versiculos) => add(
                    UpdateVersiculododia(versiculos),
                  ),
                );
      }
      if (event is UpdateVersiculododia) {
        print("hi");
        print(event.versiculoDoDia.livro);
        emit(
          VersiculoDoDiaLoaded(event.versiculoDoDia),
        );
      }
    });
  }
}
