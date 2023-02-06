import 'package:demo_api/feature/dependency_injection/service_locator.dart';
import 'package:demo_api/feature/home/cubit/load_data_cubit.dart';
import 'package:demo_api/feature/home/view/home_view.dart';
import 'package:demo_api/feature/settings/view/settings_view.dart';
import 'package:demo_api/feature/view_appointments/view/view_appointments.dart';
import 'package:demo_api/static/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

void main() {
  initLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoadDataCubit(),
        ),
      ],
      child: GetMaterialApp(
        home: const HomeView(),
        title: 'PCCS',
        theme: ThemeData(
            splashColor: Colors.blueGrey,
            primarySwatch: Colors.deepPurple,
            accentColor: Colors.deepPurpleAccent),
        getPages: [
          GetPage(name: '/', page: (() => const HomeView())),
          GetPage(
              name: AppRouters.settings, page: (() => const SettingsView())),
          GetPage(
              name: AppRouters.viewAppointments,
              page: (() => ViewAppointments())),
        ],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
