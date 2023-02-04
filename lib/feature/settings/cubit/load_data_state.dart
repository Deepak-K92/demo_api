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
  // ToDo: Change the return object from message(String) to Reponse DataClass.
  final String message;
  LoadDataLoaded({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadDataFailure extends LoadDataState {
  final String message;
  LoadDataFailure({required this.message});

  @override
  List<Object> get props => [message];
}
