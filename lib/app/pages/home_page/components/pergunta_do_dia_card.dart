import 'package:app_ibdf/app/blocs/perguntas/perguntas_bloc.dart';
import 'package:app_ibdf/app/pages/home_page/components/info_card_pergunta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Center(
      child: Container(
        constraints:
            const BoxConstraints(minHeight: 250, minWidth: 270, maxWidth: 270),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: BlocBuilder<PerguntasBloc, PerguntasState>(
                    builder: (context, state) {
            if (state is PerguntasLoading) {
              return const Center(
                child: SizedBox(
                  //height: 50,
                  //width: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is PerguntasLoaded) {
              return InfoCardPergunta(perguntaDoDia: state.perguntaDoDia);
            }
            return const Center(
              child: Text("Deu erro"),
            );
          },
        ),
      ),
    );
  }
}
