import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/utils/app_validator.dart';
import 'package:to_do_app/features/settings/data/repo/change_password_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  AppValidator appValidator = AppValidator();

  ChangePasswordRepo repo = ChangePasswordRepo();

  String? confirmPaaswordvalidator(String? value) {
    return appValidator.confirmPasswordValidator(
        value, newPasswordController.text);
  }

  void onTap() async {
    emit(ChangePasswordLoading());

    if (globalKey.currentState!.validate()) {
      var response = await repo.changePassword(
          currentpassword: oldPasswordController.text,
          newPassword: newPasswordController.text,
          confirmNewPassword: confirmNewPasswordController.text);
      response.fold((e) => emit(ChangePasswordFailing(errMessage: e)),
          (r) => emit(ChangePasswordSuccess()));
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(ChangePasswordNotValidate());
    }
  }
}
