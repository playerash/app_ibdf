// import 'package:app_ibdf/app/models/notification.dart';
// import 'package:app_ibdf/app/pages/calendar_page/calendar_page.dart';
// import 'package:app_ibdf/app/pages/notification_page/components/notification_card.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';

// import '../../constants.dart';

// class NotificationPage extends StatefulWidget {
//   const NotificationPage({Key? key, required this.localIgreja})
//       : super(key: key);
//   final String localIgreja;

//   @override
//   State<NotificationPage> createState() => _NotificationPageState();
// }

// class _NotificationPageState extends State<NotificationPage> {
//   final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   String message = "";

//   Future<QuerySnapshot> getNotifications() async {
//     QuerySnapshot notificationsFirebase =
//         await firestore.collection("notification").get();
//     return notificationsFirebase;
//   }

//   _registerOnFirebase() {
//     firebaseMessaging.subscribeToTopic('all');
//     firebaseMessaging.subscribeToTopic(widget.localIgreja.replaceAll(" ", "_"));
//     firebaseMessaging.getToken().then((value) => print(value));
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _registerOnFirebase();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kColorAzulPrincipal,
//       appBar: AppBar(
//         elevation: 0,
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => CalendarPage(
//                     localIgreja: widget.localIgreja,
//                   ),
//                 ),
//               );
//             },
//             icon: const Icon(
//               Icons.calendar_today,
//               color: kColorAmareloPrincipal,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.notifications,
//               color: kColorAmareloPrincipal,
//             ),
//           ),
//         ],
//         backgroundColor: kColorAzulPrincipal,
//         //leading: InkWell(child: Image.asset("assets/images/logo.png")),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: FutureBuilder(
//             future: getNotifications(),
//             builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.connectionState != ConnectionState.done) {
//                 return Container();
//               } else {
//                 List<Widget> notifications = [];
//                 snapshot.data!.docs.map((doc) {
//                   if(doc["topic"] == widget.localIgreja || doc["topic"] == "all"){
//                     notifications.add(NotificationCard(
//                       title: doc["title"],
//                       description: doc["description"],
//                     ));
//                   }
//                 }).toList();
//                 List<Widget> notifications2 = [];

//                 int counter = notifications.length - 1;

//                 while (counter >= 0) {
//                   notifications2.add(notifications[counter]);
//                   counter--;
//                 }

//                 return Column(children: notifications2);
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:app_ibdf/app/blocs/notification/notification_bloc.dart';
import 'package:app_ibdf/app/models/notification.dart';
import 'package:app_ibdf/app/pages/calendar_page/calendar_page.dart';
import 'package:app_ibdf/app/pages/notification_page/components/notification_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String message = "";

  Future<QuerySnapshot> getNotifications() async {
    QuerySnapshot notificationsFirebase =
        await firestore.collection("notification").get();
    return notificationsFirebase;
  }

  _registerOnFirebase() {
    firebaseMessaging.subscribeToTopic('all');
    firebaseMessaging.subscribeToTopic(widget.localIgreja.replaceAll(" ", "_"));
    firebaseMessaging.getToken().then((value) => print(value));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _registerOnFirebase();
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
        //leading: InkWell(child: Image.asset("assets/images/logo.png")),
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
              return Column();
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
