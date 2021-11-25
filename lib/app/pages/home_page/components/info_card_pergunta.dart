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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Wrap(
            children: [
              Text(
                widget.perguntaDoDia.pergunta,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 45,
              width: 150,
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

                  if (widget.perguntaDoDia.opcao2.isCorreta) {
                    setState(() {
                      buttonColor2 = widget.perguntaDoDia.opcao2.getColor();
                    });
                  } else if (widget.perguntaDoDia.opcao3.isCorreta) {
                    setState(() {
                      buttonColor3 = widget.perguntaDoDia.opcao3.getColor();
                    });
                  } else if (widget.perguntaDoDia.opcao4.isCorreta) {
                    buttonColor4 = widget.perguntaDoDia.opcao4.getColor();
                  }
                },
                child: Text(widget.perguntaDoDia.opcao1.resposta),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 45,
              width: 150,
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

                  if (widget.perguntaDoDia.opcao1.isCorreta) {
                    setState(() {
                      buttonColor1 = widget.perguntaDoDia.opcao1.getColor();
                    });
                  } else if (widget.perguntaDoDia.opcao3.isCorreta) {
                    setState(() {
                      buttonColor3 = widget.perguntaDoDia.opcao3.getColor();
                    });
                  } else if (widget.perguntaDoDia.opcao4.isCorreta) {
                    buttonColor4 = widget.perguntaDoDia.opcao4.getColor();
                  }
                },
                child: Text(widget.perguntaDoDia.opcao2.resposta),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 45,
              width: 150,
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

                  if (widget.perguntaDoDia.opcao2.isCorreta) {
                    setState(() {
                      buttonColor2 = widget.perguntaDoDia.opcao2.getColor();
                    });
                  } else if (widget.perguntaDoDia.opcao1.isCorreta) {
                    setState(() {
                      buttonColor1 = widget.perguntaDoDia.opcao1.getColor();
                    });
                  } else if (widget.perguntaDoDia.opcao4.isCorreta) {
                    buttonColor4 = widget.perguntaDoDia.opcao4.getColor();
                  }
                },
                child: Text(widget.perguntaDoDia.opcao3.resposta),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 45,
              width: 150,
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

                  if (widget.perguntaDoDia.opcao2.isCorreta) {
                    setState(() {
                      buttonColor2 = widget.perguntaDoDia.opcao2.getColor();
                    });
                  } else if (widget.perguntaDoDia.opcao3.isCorreta) {
                    setState(() {
                      buttonColor3 = widget.perguntaDoDia.opcao3.getColor();
                    });
                  } else if (widget.perguntaDoDia.opcao1.isCorreta) {
                    buttonColor1 = widget.perguntaDoDia.opcao1.getColor();
                  }
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
