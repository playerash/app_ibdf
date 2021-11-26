import 'package:app_ibdf/app/models/pergunta_do_dia.dart';

abstract class BasePerguntasRepository {
  Stream<PerguntaDoDia> getPergunta();
}
