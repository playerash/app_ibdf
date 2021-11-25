import 'package:app_ibdf/app/models/pergunta_do_dia.dart';
import 'package:app_ibdf/app/pages/home_page/components/info_card_pergunta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PerguntaDoDiaCard extends StatefulWidget {
  const PerguntaDoDiaCard({
    Key? key,
  }) : super(key: key);

  @override
  State<PerguntaDoDiaCard> createState() => _PerguntaDoDiaCardState();
}

class _PerguntaDoDiaCardState extends State<PerguntaDoDiaCard> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Future<DocumentSnapshot> getPerguntaInfo() async {
      DocumentSnapshot versiculoFirebase =
          await firestore.collection("pergunta").doc("1").get();
      return versiculoFirebase;
    }

    return Center(
      child: Container(
          constraints: const BoxConstraints(
              minHeight: 250, minWidth: 270, maxWidth: 270),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          child: FutureBuilder(
            future: getPerguntaInfo(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                PerguntaDoDia perguntaDoDia = PerguntaDoDia(
                  pergunta: snapshot.data?.get("pergunta"),
                  opcao1: Opcao(
                    snapshot.data?.get("isCorreta1"),
                    resposta: snapshot.data?.get("resposta1"),
                  ),
                  opcao2: Opcao(
                    snapshot.data?.get("isCorreta2"),
                    resposta: snapshot.data?.get("resposta2"),
                  ),
                  opcao3: Opcao(
                    snapshot.data?.get("isCorreta3"),
                    resposta: snapshot.data?.get("resposta3"),
                  ),
                  opcao4: Opcao(
                    snapshot.data?.get("isCorreta4"),
                    resposta: snapshot.data?.get("resposta4"),
                  ),
                );
                return InfoCardPergunta(perguntaDoDia: perguntaDoDia);
              }
            },
          ),),
    );
  }
}

