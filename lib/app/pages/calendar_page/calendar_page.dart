import 'package:app_ibdf/app/constants.dart';
import 'package:app_ibdf/app/models/events.dart';
import 'package:app_ibdf/app/pages/calendar_page/components/calendario.dart';
import 'package:app_ibdf/app/pages/notification_page/notification_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key, required this.localIgreja}) : super(key: key);
  final String localIgreja;

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> getCalendar() async {
    QuerySnapshot notificationsFirebase =
        await firestore.collection("calendario").get();
    return notificationsFirebase;
  }

  List datas = [];
  List eventos = [];

  Map<DateTime, List<Events>> selectedEvents = {};

  @override
  void initState() {
    selectedEvents = {};
    datas = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kColorAzulPrincipal,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
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
        //leading: Image.asset("assets/images/logo.png"),
      ),
      body: FutureBuilder(
          future: getCalendar(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            } else {
              snapshot.data!.docs.map((doc) {
                if (doc["local"] == widget.localIgreja) {
                  eventos.add(Events(
                    title: doc["title"],
                    local: doc["local"],
                  ));
                  datas.add(DateTime.utc(
                    doc["year"],
                    doc["month"],
                    doc["day"],
                  ));
                } else {
                }
              }).toList();
              
              int counter = 0;
              while (counter < datas.length) {
                if (selectedEvents[datas[counter]] != null) {
                  selectedEvents[datas[counter]]!.add(eventos[counter]);
                } else {
                  selectedEvents[datas[counter]] = [eventos[counter]];
                }
                counter++;
              }

              return Calendario(selectedEvents: selectedEvents);
            }
          }),
    );
  }
}
