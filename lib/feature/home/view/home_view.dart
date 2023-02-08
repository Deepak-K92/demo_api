import 'package:demo_api/feature/home/cubit/load_data_cubit.dart';
import 'package:demo_api/feature/home/model/input_parameter_model.dart';
import 'package:demo_api/feature/home/model/response_view_model.dart';
import 'package:demo_api/feature/home/model/view_appointments_arg.dart';
import 'package:demo_api/feature/home/view/widgets/custom_button.dart';
import 'package:demo_api/static/app_router.dart';
import 'package:demo_api/static/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'widgets/custom_title_cards.dart';

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
  }

  _buildBody({ResponseViewModel? model}) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: StaticVal.size_25,
        ),
        children: <Widget>[
          SizedBox(
            height: StaticVal.size_250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTitleButton(
                    buttonName: Static.settings,
                    icon: Icons.settings,
                    primaryColor: Colors.white,
                    secondayColor: Colors.deepPurple,
                    onPressed: () async {
                      BlocProvider.of<LoadDataCubit>(context).getInitial();
                      inputVal = await Get.toNamed(AppRouters.settings);
                    },
                  ),
                ),
                Expanded(
                  child: CustomTitleButton(
                    buttonName: Static.viewAppoinments,
                    icon: Icons.list_sharp,
                    onPressed: () {
                      _navigateToViewAppointments(model: model);
                    },
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
            buttonName: Static.refreshData,
            icon: const Icon(Icons.refresh, size: StaticVal.size_25),
            onPressed: () {
              _refreshData(model);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text(Static.home),
      ),
      body: BlocConsumer<LoadDataCubit, LoadDataState>(
        listener: (context, state) {
          if (state is LoadDataLoaded) {
            _showSnackBar(
                context: context,
                message: state.message,
                color: state.model.responseCode == Static.responseCodeOK
                    ? Colors.green
                    : Colors.deepOrange,
                isSuccess: true,
                icon: state.model.responseCode == Static.responseCodeOK
                    ? Icons.check_circle_outline
                    : Icons.priority_high_outlined);
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

  void _refreshData(ResponseViewModel? model) async {
    BlocProvider.of<LoadDataCubit>(context).getData(
      InputParameterModel(
        url: inputVal?.url ?? '',
        username: inputVal?.username ?? '',
        password: inputVal?.password ?? '',
        selectedDate: inputVal?.selectedDate ?? DateTime.now(),
      ),
    );
    BlocProvider.of<LoadDataCubit>(context).getLoadingState();
  }

  void _navigateToViewAppointments({ResponseViewModel? model}) =>
      BlocProvider.of<LoadDataCubit>(context).navigateToAppointView();
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
      duration: Duration(milliseconds: StaticVal.size_2100.toInt()),
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
