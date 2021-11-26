import 'package:app_ibdf/app/models/versiculo_do_dia.dart';
import 'package:app_ibdf/app/repository/versiculo_do_dia/base_versiculo_do_dia_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class VersiculoDoDiaRepository extends BaseVersiculoDoDiaRepository {
  final FirebaseFirestore _firebaseFirestore;

  VersiculoDoDiaRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<VersiculoDoDia> getAllVersiculos() {
    return _firebaseFirestore
        .collection("versiculos")
        .doc("1")
        .snapshots()
        .map((snapshots) {
      return VersiculoDoDia(
        livro: snapshots["livro"],
        capitulo: snapshots["capitulo"],
        versiculo: snapshots["versiculo"],
        textoVersiculo: snapshots["textoVersiculo"],
      );
    });
  }
}
