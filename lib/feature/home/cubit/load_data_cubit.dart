import 'package:bloc/bloc.dart';
import 'package:demo_api/feature/dependency_injection/service_locator.dart';
import 'package:demo_api/feature/home/domain_layer/domain_model/response_domain_model.dart';
import 'package:demo_api/feature/home/model/response_view_model.dart';
import 'package:flutter/material.dart';

import '../domain_layer/domain_model/service_parameters_domain_model.dart';
import '../domain_layer/usecase/post_data_usecase.dart';
import '../model/input_parameter_model.dart';
import 'package:equatable/equatable.dart';

part 'load_data_state.dart';

class LoadDataCubit extends Cubit<LoadDataState> {
  LoadDataCubit() : super(LoadDataInitial());

  getInitial() => emit(LoadDataInitial());

  getLoadingState() => emit(LoadDataLoading());

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
      print(viewModel.responseCode);
      if (viewModel.responseCode == 'SC0001') {
        print("Loaded");
        emit(LoadDataLoaded(
            model: viewModel, message: 'Data Loaded Successfully!'));
      } else {
        print("No Data");
        emit(LoadDataLoaded(
            model: viewModel, message: 'There is No Data for this Date'));
      }
      print(" ${viewModel.fullName}");
    } catch (e) {
      emit(LoadDataFailure(
        message: 'Data Failed to Load. Please check the details.',
        icons: Icons.warning_amber_outlined,
      ));
    }
  }
}
