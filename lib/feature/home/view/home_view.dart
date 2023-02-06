import 'package:demo_api/feature/home/cubit/load_data_cubit.dart';
import 'package:demo_api/feature/home/model/input_parameter_model.dart';
import 'package:demo_api/feature/home/view/widgets/custom_button.dart';
import 'package:demo_api/static/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late InputParameterModel inputVal;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
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
              onPressed: () async {
                inputVal = await Get.toNamed(AppRouters.settings);
                print(inputVal.username);
              },
            ),
            CustomButton(
              buttonName: 'View Appointments',
              icon: const Icon(Icons.list_sharp),
              onPressed: () {
                Get.toNamed(AppRouters.viewAppointments);
              },
            ),
            CustomButton(
              buttonName: 'Refresh Data',
              icon: const Icon(Icons.refresh),
              onPressed: () {
                BlocProvider.of<LoadDataCubit>(context).getData(
                  InputParameterModel(
                    url: url,
                    username: 'Gary',
                    password: '123456789',
                    selectedDate: DateTime.now(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

const url =
    'https://www.skylinecms.co.uk/alpha/RemoteEngineerAPI/GetAppointmentDetails';
