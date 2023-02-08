import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:demo_api/feature/dependency_injection/service_locator.dart';
import 'package:demo_api/feature/home/domain_layer/domain_model/response_domain_model.dart';
import 'package:demo_api/feature/home/model/response_view_model.dart';
import 'package:demo_api/static/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../static/app_router.dart';
import '../domain_layer/domain_model/service_parameters_domain_model.dart';
import '../domain_layer/usecase/post_data_usecase.dart';
import '../model/input_parameter_model.dart';
import 'package:equatable/equatable.dart';

import '../model/view_appointments_arg.dart';

part 'load_data_state.dart';

class LoadDataCubit extends Cubit<LoadDataState> {
  LoadDataCubit() : super(LoadDataInitial());
  late final pref = SharedPreferences.getInstance();

  getInitial() => emit(LoadDataInitial());

  getLoadingState() async {
    emit(LoadDataLoading());
  }

  navigateToAppointView() async {
    final prefs = await pref;
    getLoadingState();
    final response = await (jsonDecode(prefs.getString('response')!));
    final jsonModel = ResponseViewModel.fromJson(response);

    getInitial();

    Get.toNamed(
      AppRouters.viewAppointments,
      arguments: ViewAppointmentsArguments(
        responseCode: jsonModel.responseCode,
        responseDescription: jsonModel.responseDescription,
        fullName: jsonModel.fullName,
        appointments: jsonModel.appointment,
      ),
    );
  }

  getData(InputParameterModel model) async {
    PostDataUseCase postDataUseCase = locator<PostDataUseCase>();
    getLoadingState();
    try {
      final ResponseDomainModel data =
          await postDataUseCase.getData(ServiceParameterDomainModel(
        url: model.url,
        userName: model.username,
        password: model.password,
        currentDate: model.selectedDate,
      ));

      ResponseViewModel viewModel = data.mapToViewModel();
      final prefs = await pref;
      final response =
          await prefs.setString('response', jsonEncode(viewModel.toJson()));
      if (viewModel.responseCode == Static.responseCodeOK) {
        emit(LoadDataLoaded(
            model: viewModel, message: Static.snackBarMessageforSuccess));
        emit(LoadDataLoading());
        await Future.delayed(Duration(seconds: StaticVal.size_2.toInt()));
        emit(LoadDataInitial());
      } else {
        emit(LoadDataLoaded(
            model: viewModel,
            message: Static.snackBarMessageforSuccessButNoData));
        emit(LoadDataLoading());
        await Future.delayed(Duration(seconds: StaticVal.size_2.toInt()));
        emit(LoadDataInitial());
      }
    } catch (e) {
      emit(LoadDataFailure(
        message: Static.snackBarMessageforFailure,
        icons: Icons.warning_amber_outlined,
      ));
    }
  }
}
