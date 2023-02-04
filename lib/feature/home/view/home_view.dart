import 'package:demo_api/feature/home/view/widgets/custom_button.dart';
import 'package:demo_api/static/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        children: <Widget>[
          CustomButton(
            buttonName: 'Settings',
            icon: const Icon(Icons.settings),
            onPressed: () => context.goNamed(AppRouters.settings),
          ),
          CustomButton(
            buttonName: 'View Appointments',
            icon: const Icon(Icons.list_sharp),
            onPressed: () => context.goNamed(AppRouters.viewAppointments),
          ),
          CustomButton(
            buttonName: 'Refresh Data',
            icon: const Icon(Icons.refresh),
            onPressed: () => null,
          ),
        ],
      ),
    );
  }
}
