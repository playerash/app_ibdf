import 'package:app_ibdf/app/blocs/notification/notification_bloc.dart';
import 'package:app_ibdf/app/constants.dart';
import 'package:app_ibdf/app/pages/splash_screen/splash_screen.dart';
import 'package:app_ibdf/app/repository/notifications/notification_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NotificationBloc(
            notificationRepository: NotificationRepository(),
          )..add(LoadNotifications())
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //iconTheme: IconThemeData(color: Color(0xFFE0B723)),
          inputDecorationTheme: kDefaultInputDecorationTheme,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
