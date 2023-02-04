import 'package:demo_api/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      title: 'PCCS',
      theme: ThemeData(
          splashColor: Colors.blueGrey,
          primarySwatch: Colors.amber,
          accentColor: Colors.amberAccent),
    );
  }
}
