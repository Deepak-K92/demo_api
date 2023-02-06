import 'package:demo_api/feature/home/cubit/load_data_cubit.dart';
import 'package:demo_api/feature/home/model/input_parameter_model.dart';
import 'package:demo_api/feature/home/view/widgets/custom_button.dart';
import 'package:demo_api/static/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final url =
      'https://www.skylinecms.co.uk/alpha/RemoteEngineerAPI/GetAppointmentDetails';
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<LoadDataCubit>(context).getData(InputParameterModel(
      url: url,
      username: 'Gary',
      password: '123456789',
      selectedDate: DateTime.now(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
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
      ),
    );
  }
}
