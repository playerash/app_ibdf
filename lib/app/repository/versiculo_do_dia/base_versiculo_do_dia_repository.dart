import 'package:app_ibdf/app/models/versiculo_do_dia.dart';

abstract class BaseVersiculoDoDiaRepository {
  Stream<VersiculoDoDia> getAllVersiculos();
}
