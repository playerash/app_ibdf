import 'package:app_ibdf/app/blocs/notification/notification_bloc.dart';
import 'package:app_ibdf/app/pages/calendar_page/calendar_page.dart';
import 'package:app_ibdf/app/pages/notification_page/components/notification_card.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key, required this.localIgreja})
      : super(key: key);
  final String localIgreja;

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  String message = "";


  _registerOnFirebase() {
    firebaseMessaging.subscribeToTopic('all');
    firebaseMessaging.subscribeToTopic(widget.localIgreja.replaceAll(" ", "_"));
  }

  @override
  void initState() {
    _registerOnFirebase();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorAzulPrincipal,
      appBar: AppBar(
        elevation: 0,
        actions: [
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
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: kColorAmareloPrincipal,
            ),
          ),
        ],
        backgroundColor: kColorAzulPrincipal,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: BlocBuilder<NotificationBloc, NotificationState>(
              builder: (context, state) {
            if (state is NotificationLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is NotificationLoaded) {
              List<Widget> notifications = [];
              state.notifications.map((doc) {       
                if (doc.topic == widget.localIgreja || doc.topic == "all") {
                  notifications.add(NotificationCard(
                    title: doc.title,
                    description: doc.description,
                  ));
                }
              }).toList();

              List<Widget> notifications2 = [];

              int counter = notifications.length - 1;

              while (counter >= 0) {
                notifications2.add(notifications[counter]);
                counter--;
              }

              return Column(
                children: notifications2,
              );
            }
            return const Center(
              child: Text("Algo deu errado"),
            );
          }),
        ),
      ),
    );
  }
}
