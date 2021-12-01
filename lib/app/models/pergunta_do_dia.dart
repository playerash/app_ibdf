import 'package:flutter/material.dart';

class PerguntaDoDia {
  final String pergunta;
  final Opcao opcao1;
  final Opcao opcao2;
  final Opcao opcao3;
  final Opcao opcao4;

  PerguntaDoDia({
    required this.pergunta,
    required this.opcao1,
    required this.opcao2,
    required this.opcao3,
    required this.opcao4,
  });
}

class Opcao {
  final String resposta;
  bool isCorreta = false;

  Color getColor() {
    if (isCorreta) {
      return const Color(0xffBEFF9F);
    } else {
      return const Color(0xffFF8989);
    }
  }

  Opcao(
    this.isCorreta, {
    required this.resposta,
  });
}
