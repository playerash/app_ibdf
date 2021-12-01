import 'package:app_ibdf/app/constants.dart';
import 'package:app_ibdf/app/pages/calendar_page/calendar_page.dart';
import 'package:app_ibdf/app/pages/notification_page/notification_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key, required this.localIgreja}) : super(key: key);
  final String localIgreja;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController questionController = TextEditingController();

  sendQuestion(String question) {
    firestore
        .collection("questions")
        .doc("${DateTime.now()}")
        .set({"pergunta": question});
  }

  @override
  void dispose() {
    questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorAzulPrincipal,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.inventory_2_outlined,
              color: kColorAmareloPrincipal,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => CalendarPage(
                    localIgreja: widget.localIgreja,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.calendar_today,
              color: kColorAmareloPrincipal,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => NotificationPage(
                    localIgreja: widget.localIgreja,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications,
              color: kColorAmareloPrincipal,
            ),
          ),
        ],
        backgroundColor: kColorAzulPrincipal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                controller: questionController,
                decoration: const InputDecoration(
                    helperStyle: TextStyle(
                      color: Colors.white,
                    ),
                    labelText: "Faça uma Pergunta",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: "Digite sua pergunta",
                    hintStyle: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kColorAmareloPrincipal,
                ),
                onPressed: () {
                  sendQuestion(questionController.text);
                  questionController.text = "";
                },
                child: const Text("Enviar"))
          ],
        ),
      ),
    );
  }
}
