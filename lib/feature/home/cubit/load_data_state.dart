part of 'load_data_cubit.dart';

@immutable
abstract class LoadDataState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadDataInitial extends LoadDataState {
  @override
  List<Object> get props => [];
}

class LoadDataLoading extends LoadDataState {
  @override
  List<Object> get props => [];
}

class LoadDataLoaded extends LoadDataState {
  final ResponseViewModel model;
  final String message;
  LoadDataLoaded({required this.model, required this.message});

  @override
  List<Object> get props => [model, message];
}

class LoadDataFailure extends LoadDataState {
  final IconData icons;
  final String message;
  LoadDataFailure({required this.message, required this.icons});

  @override
  List<Object> get props => [message, icons];
}
