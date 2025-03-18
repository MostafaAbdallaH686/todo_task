import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/add_task/data/repo/add_task_repo.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  AddTaskRepo repo = AddTaskRepo();
  static AddTaskCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController titelController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String? validatorTitle(String? value) {
    if (value == null || value.isEmpty) {
      return "please fill this field !";
    }
    return null;
  }

  String? validatorDescription(String? value) {
    if (value == null || value.isEmpty) {
      return "please fill this field !";
    }
    return null;
  }

  void onTap() async {
    emit(AddTaskLoading());
    await Future.delayed(Duration(seconds: 2));
    if (globalKey.currentState!.validate()) {
      var res = await repo.addTask(
          title: titelController.text, description: descriptionController.text);
      res.fold(
        (error) => emit(AddTaskError(errMessage: error)),
        (right) => emit(AddTaskSuccess()),
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(AddTaskError(errMessage: "please fill ths fields !"));
    }
  }
}
