import 'package:go_router/go_router.dart';
import '../feature/home/view/home_view.dart';
import '../feature/settings/view/settings_view.dart';
import '../feature/view_appointments/view/view_appointments.dart';

import '../static/app_router.dart';

final GoRouter _router = GoRouter(initialLocation: '/', routes: <GoRoute>[
  GoRoute(
      name: AppRouters.home,
      path: '/',
      builder: (context, GoRouterState state) => const HomeView(),
      routes: [
        GoRoute(
          name: AppRouters.settings,
          path: 'settings_view.dart',
          builder: (context, GoRouterState state) => const SettingsView(),
        ),
        GoRoute(
          name: AppRouters.viewAppointments,
          path: 'view_appointments.dart',
          builder: (context, GoRouterState state) => const ViewAppointments(),
        ),
      ]),
]);

GoRouter get router => _router;
