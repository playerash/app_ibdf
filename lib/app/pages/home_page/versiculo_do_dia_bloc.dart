import 'package:app_ibdf/app/models/versiculo_do_dia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bloc/bloc.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class VersiculoBloc extends Bloc<DocumentSnapshot, VersiculoDoDia> {
  VersiculoBloc()
      : super(VersiculoDoDia(
          livro: "livro",
          capitulo: "capitulo",
          versiculo: "versiculo",
          textoVersiculo: "textoVersiculo",
        )) {
    on<DocumentSnapshot>(getVersiculo);
  }

  getVersiculo(DocumentSnapshot doc, Emitter emit) {
    VersiculoDoDia versiculoDoDia = VersiculoDoDia(
      livro: doc.get("livro"),
      capitulo: doc.get("capitulo"),
      versiculo: doc.get("versiculo"),
      textoVersiculo: doc.get("textoVersiculo"),
    );
    emit(versiculoDoDia);
  }
}
