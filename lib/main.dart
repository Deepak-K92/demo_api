import 'package:demo_api/feature/dependency_injection/service_locator.dart';
import 'package:demo_api/feature/home/cubit/load_data_cubit.dart';
import 'package:demo_api/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoadDataCubit(),
        ),
      ],
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        title: 'PCCS',
        theme: ThemeData(
            splashColor: Colors.blueGrey,
            primarySwatch: Colors.deepPurple,
            accentColor: Colors.deepPurpleAccent),
      ),
    );
  }
}
