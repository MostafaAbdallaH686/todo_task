import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/model/task_model.dart';

sealed class HomeState extends Equatable {}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeSuccessNoDataState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeSuccessState extends HomeState {
  final List<TaskModel> tasks;

  HomeSuccessState({required this.tasks});
  @override
  List<Object?> get props => [tasks];
}

class HomeErrorState extends HomeState {
  final String errMessage;

  HomeErrorState({required this.errMessage});
  @override
  List<Object?> get props => [errMessage];
}
