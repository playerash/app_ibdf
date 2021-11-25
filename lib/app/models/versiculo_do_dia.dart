import 'package:cloud_firestore/cloud_firestore.dart';

class VersiculoDoDia {
  final String livro;
  final String capitulo;
  final String versiculo;
  final String textoVersiculo;

  static VersiculoDoDia fromSnapshot(DocumentSnapshot snap) {
    VersiculoDoDia versiculoDoDia = VersiculoDoDia(
      livro: snap["livro"],
      capitulo: snap["capitulo"],
      versiculo: snap["versiculo"],
      textoVersiculo: snap["textoVersiculo"],
    );
    return versiculoDoDia;
  }

  VersiculoDoDia({
    required this.livro,
    required this.capitulo,
    required this.versiculo,
    required this.textoVersiculo,
  });
}

VersiculoDoDia versiculoDoDia = VersiculoDoDia(
  livro: "Isaías",
  capitulo: "43",
  versiculo: "19",
  textoVersiculo:
      "Eis que farei uma coisa nova, e, agora, sairá a luz, porventura, não a sabereis? Eis que porei um caminho no deserto e rios, no ermo",
);
