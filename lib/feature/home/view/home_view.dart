import 'package:demo_api/feature/home/cubit/load_data_cubit.dart';
import 'package:demo_api/feature/home/model/input_parameter_model.dart';
import 'package:demo_api/feature/home/model/response_view_model.dart';
import 'package:demo_api/feature/home/model/view_appointments_arg.dart';
import 'package:demo_api/feature/home/view/widgets/custom_button.dart';
import 'package:demo_api/feature/view_appointments/view/view_appointments.dart';
import 'package:demo_api/static/app_router.dart';
import 'package:demo_api/static/strings.dart';
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
    // WidgetsBinding.instance.addPostFrameCallback((_) {});
    BlocProvider.of<LoadDataCubit>(context).getData(InputParameterModel(
        url: Static.url,
        username: Static.userName,
        password: Static.password,
        selectedDate: DateTime.now()));
  }

  _buildBody({ResponseViewModel? model}) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
        children: <Widget>[
          CustomButton(
            buttonName: Static.settings,
            icon: const Icon(Icons.settings),
            onPressed: () async {
              BlocProvider.of<LoadDataCubit>(context).getInitial();
              inputVal = await Get.toNamed(AppRouters.settings);
            },
          ),
          CustomButton(
            buttonName: Static.viewAppoinments,
            icon: const Icon(Icons.list_sharp),
            onPressed: () {
              BlocProvider.of<LoadDataCubit>(context).getInitial();
              Get.toNamed(AppRouters.viewAppointments,
                  arguments: ViewAppointmentsArguments(
                      responseCode: model?.responseCode ?? '',
                      responseDescription: model?.responseDescription ?? '',
                      fullName: model?.fullName ?? '',
                      itemList: model?.appointment ?? []));
            },
          ),
          CustomButton(
            buttonName: Static.refreshData,
            icon: const Icon(Icons.refresh),
            onPressed: () {
              BlocProvider.of<LoadDataCubit>(context).getData(
                InputParameterModel(
                  url: inputVal?.url ?? '',
                  username: inputVal?.username ?? '',
                  password: inputVal?.password ?? '',
                  selectedDate: inputVal.selectedDate,
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
        title: const Text(Static.home),
      ),
      body: BlocConsumer<LoadDataCubit, LoadDataState>(
        listener: (context, state) {
          if (state is LoadDataLoaded) {
            _showSnackBar(
                context: context,
                message: state.message,
                color: Colors.green,
                isSuccess: true,
                icon: Icons.check_circle_outline);
          }
          if (state is LoadDataFailure) {
            _showSnackBar(
                context: context,
                message: state.message,
                color: Colors.red,
                isSuccess: false,
                icon: state.icons);
          }
        },
        builder: (context, state) {
          if (state is LoadDataInitial ||
              state is LoadDataLoaded ||
              state is LoadDataFailure) {
            if (state is LoadDataLoaded) {
              return _buildBody(model: state.model);
            }
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

_showSnackBar(
    {required BuildContext context,
    required String message,
    required IconData icon,
    Color? color,
    bool? isSuccess}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: StaticVal.size_3_5,
      backgroundColor: color,
      duration: Duration(seconds: StaticVal.size_2.toInt()),
      content: Row(
        children: [
          Expanded(
            flex: StaticVal.size_1.toInt(),
            child: Icon(
              icon,
              color: Colors.white,
              size: StaticVal.size_50,
            ),
          ),
          Expanded(
            flex: StaticVal.size_4.toInt(),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: StaticVal.size_18, color: Colors.white),
            ),
          )
        ],
      ),
      behavior: isSuccess == true
          ? SnackBarBehavior.floating
          : SnackBarBehavior.fixed,
      margin: isSuccess == true
          ? EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height * 0.20,
            )
          : null,
    ),
  );
}
