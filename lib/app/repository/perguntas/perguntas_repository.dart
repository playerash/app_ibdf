import 'package:app_ibdf/app/models/pergunta_do_dia.dart';
import 'package:app_ibdf/app/repository/perguntas/base_perguntas_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PerguntasRepository extends BasePerguntasRepository {
  final FirebaseFirestore _firebaseFirestore;

  PerguntasRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<PerguntaDoDia> getPergunta() {
    return _firebaseFirestore
        .collection("pergunta")
        .doc("1")
        .snapshots()
        .map((snapshot) {
      return PerguntaDoDia(
        pergunta: snapshot["pergunta"],
        opcao1: Opcao(snapshot["isCorreta1"], resposta: snapshot["resposta1"]),
        opcao2: Opcao(snapshot["isCorreta2"], resposta: snapshot["resposta2"]),
        opcao3: Opcao(snapshot["isCorreta3"], resposta: snapshot["resposta3"]),
        opcao4: Opcao(snapshot["isCorreta4"], resposta: snapshot["resposta4"]),
      );
    });
  }
}
