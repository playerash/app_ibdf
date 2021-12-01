import 'package:app_ibdf/app/constants.dart';
import 'package:app_ibdf/app/pages/calendar_page/calendar_page.dart';
import 'package:app_ibdf/app/pages/home_page/components/pergunta_do_dia_card.dart';
import 'package:app_ibdf/app/pages/home_page/components/versiculo_do_dia_card.dart';
import 'package:app_ibdf/app/pages/notification_page/notification_page.dart';
import 'package:app_ibdf/app/pages/question_page/question_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.localIgreja}) : super(key: key);
  final String localIgreja;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorAzulPrincipal,
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuestionPage(localIgreja: localIgreja)
                  ),
                );
              },
              icon: const Icon(
                Icons.inventory_2_outlined,
                color: kColorAmareloPrincipal,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CalendarPage(
                      localIgreja: localIgreja,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => NotificationPage(
                      localIgreja: localIgreja,
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
          leading: Image.asset("assets/images/logo.png"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const VersiculoDoDiaCard(),
                    const SizedBox(width: 20),
                    Center(
                      child: Container(
                        constraints: const BoxConstraints(
                            minHeight: 150,
                            minWidth: 250,
                            maxWidth: 250),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: const [
                              Text(
                                "Por que o véu rasgou?",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "O véu rasgou para simbolizar que agora a presença de Deus estava acessivél para todos",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const PerguntaDoDiaCard(),
              const SizedBox(height: 40),
            ],
          ),
        ));
  }
}
