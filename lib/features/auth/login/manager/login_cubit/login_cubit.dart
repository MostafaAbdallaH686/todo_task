import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/function/app_delay.dart';
import 'package:to_do_app/features/auth/login/data/repo/login_repo.dart';
import 'package:to_do_app/features/auth/login/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  // login repo

  LoginRepo repo = LoginRepo();

  // form

  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // controller

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // validator

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter name !";
    } else {
      return null;
    }
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter password !";
    } else {
      return null;
    }
  }

  void onTap() async {
    emit(LoginLoadingState());
    await AppDelay.delayLoading();

    if (globalKey.currentState!.validate()) {
      var resonse = await repo.login(
          name: nameController.text, password: passwordController.text);
      resonse.fold((error) {
        emit(LoginFailingState(errMessage: error));
      }, (r) {
        emit(LoginSuccessState(loginModel: r));
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(LoginNotValidateState());
    }
  }
}
