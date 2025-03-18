part of 'add_task_cubit.dart';

sealed class AddTaskState extends Equatable {
  const AddTaskState();

  @override
  List<Object> get props => [];
}

final class AddTaskInitial extends AddTaskState {}

final class AddTaskLoading extends AddTaskState {}

final class AddTaskSuccess extends AddTaskState {}

final class AddTaskError extends AddTaskState {
  final String errMessage;

  const AddTaskError({required this.errMessage});
  @override
  List<Object> get props => [errMessage];
}
