import 'package:app_ibdf/app/models/pergunta_do_dia.dart';
import 'package:flutter/material.dart';

class InfoCardPergunta extends StatefulWidget {
  const InfoCardPergunta({Key? key, required this.perguntaDoDia})
      : super(key: key);
  final PerguntaDoDia perguntaDoDia;

  @override
  State<InfoCardPergunta> createState() => _InfoCardPerguntaState();
}

class _InfoCardPerguntaState extends State<InfoCardPergunta> {
  Color buttonColor1 = const Color(0xFFE8F0F9);
  Color buttonColor2 = const Color(0xFFE8F0F9);
  Color buttonColor3 = const Color(0xFFE8F0F9);
  Color buttonColor4 = const Color(0xFFE8F0F9);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Wrap(
            children: [
              Text(
                widget.perguntaDoDia.pergunta,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: buttonColor1,
                ),
                onPressed: () {
                  setState(() {
                    buttonColor1 = widget.perguntaDoDia.opcao1.getColor();
                  });
                },
                child: Text(widget.perguntaDoDia.opcao1.resposta),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: buttonColor2,
                ),
                onPressed: () {
                  setState(() {
                    buttonColor2 = widget.perguntaDoDia.opcao2.getColor();
                  });
                },
                child: Text(widget.perguntaDoDia.opcao2.resposta),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: buttonColor3,
                ),
                onPressed: () {
                  setState(() {
                    buttonColor3 = widget.perguntaDoDia.opcao3.getColor();
                  });
                },
                child: Text(widget.perguntaDoDia.opcao3.resposta),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: buttonColor4,
                ),
                onPressed: () {
                  setState(() {
                    buttonColor4 = widget.perguntaDoDia.opcao4.getColor();
                  });
                },
                child: Text(widget.perguntaDoDia.opcao4.resposta),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
