import 'package:demo_api/feature/home/cubit/load_data_cubit.dart';
import 'package:demo_api/feature/home/model/input_parameter_model.dart';
import 'package:demo_api/feature/home/view/widgets/custom_button.dart';
import 'package:demo_api/static/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var inputVal;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  _buildBody() {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
        children: <Widget>[
          CustomButton(
            buttonName: 'Settings',
            icon: const Icon(Icons.settings),
            onPressed: () async {
              BlocProvider.of<LoadDataCubit>(context).getInitial();
              inputVal = await Get.toNamed(AppRouters.settings);
            },
          ),
          CustomButton(
            buttonName: 'View Appointments',
            icon: const Icon(Icons.list_sharp),
            onPressed: () {
              BlocProvider.of<LoadDataCubit>(context).getInitial();
              Get.toNamed(AppRouters.viewAppointments);
            },
          ),
          CustomButton(
            buttonName: 'Refresh Data',
            icon: const Icon(Icons.refresh),
            onPressed: () {
              BlocProvider.of<LoadDataCubit>(context).getData(
                InputParameterModel(
                  url: inputVal?.url ?? '',
                  username: inputVal?.username ?? '',
                  password: inputVal?.password ?? '',
                  selectedDate: DateTime.now(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: BlocConsumer<LoadDataCubit, LoadDataState>(
        listener: (context, state) {
          if (state is LoadDataLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                elevation: 3.5,
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
                content: Text(state.message),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).size.height * 0.20,
                ),
              ),
            );
          }
          if (state is LoadDataFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                elevation: 3.5,
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
                content: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        state.icons,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        state.message,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadDataInitial ||
              state is LoadDataLoaded ||
              state is LoadDataFailure) {
            return _buildBody();
          } else if (state is LoadDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
