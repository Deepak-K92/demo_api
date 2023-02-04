import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'load_data_state.dart';

class LoadDataCubit extends Cubit<LoadDataState> {
  LoadDataCubit() : super(LoadDataInitial());

  getInitial() => emit(LoadDataInitial());

  getLoadingState() => emit(LoadDataLoading());
}
