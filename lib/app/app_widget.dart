import 'package:app_ibdf/app/blocs/calendario/calendario_bloc.dart';
import 'package:app_ibdf/app/blocs/notification/notification_bloc.dart';
import 'package:app_ibdf/app/blocs/perguntas/perguntas_bloc.dart';
import 'package:app_ibdf/app/blocs/versiculo_do_dia/versiculododia_bloc.dart';
import 'package:app_ibdf/app/constants.dart';
import 'package:app_ibdf/app/pages/splash_screen/splash_screen.dart';
import 'package:app_ibdf/app/repository/events/events_repository.dart';
import 'package:app_ibdf/app/repository/notifications/notification_repository.dart';
import 'package:app_ibdf/app/repository/perguntas/perguntas_repository.dart';
import 'package:app_ibdf/app/repository/versiculo_do_dia/versiculo_do_dia_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CalendarioBloc(
            eventsRepository: EventsRepository(),
          )..add(
              LoadCalendario(),
            ),
        ),
        BlocProvider(
          create: (_) => PerguntasBloc(
            perguntasRepository: PerguntasRepository(),
          )..add(
              LoadPerguntas(),
            ),
        ),
        BlocProvider(
          create: (_) => VersiculoDoDiaBloc(
            versiculoDoDiaRepository: VersiculoDoDiaRepository(),
          )..add(
              LoadVersiculododia(),
            ),
        ),
        BlocProvider(
          create: (_) => NotificationBloc(
            notificationRepository: NotificationRepository(),
          )..add(
              LoadNotifications(),
            ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          inputDecorationTheme: kDefaultInputDecorationTheme,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
