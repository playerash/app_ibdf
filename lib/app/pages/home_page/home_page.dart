import 'package:app_ibdf/app/constants.dart';
import 'package:app_ibdf/app/pages/calendar_page/calendar_page.dart';
import 'package:app_ibdf/app/pages/home_page/components/pergunta_do_dia_card.dart';
import 'package:app_ibdf/app/pages/home_page/components/versiculo_do_dia_card.dart';
import 'package:app_ibdf/app/pages/notification_page/notification_page.dart';
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
                  builder: (_) => CalendarPage(localIgreja: localIgreja,),
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
                  builder: (_) => NotificationPage(localIgreja: localIgreja,),
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
          children: const [
            SizedBox(height: 40),
            VersiculoDoDiaCard(),
            SizedBox(height: 40),
            PerguntaDoDiaCard()
          ],
        ),
      ),
    );
  }
}
