import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/core/function/app_delay.dart';
import 'package:to_do_app/core/function/app_route.dart';
import 'package:to_do_app/features/auth/register/data/repo/register_repo.dart';
import 'package:to_do_app/features/auth/register/manager/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  // form widget
  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // controller
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // repo
  RegisterRepo registerRepo = RegisterRepo();

  // xFile image

  XFile? image;
  ImagePicker _imagePicker = ImagePicker();

  // read Image

  void _readImageFromGallery() async {
    image = await _imagePicker.pickImage(source: ImageSource.gallery);
    emit(RegisterPickImage());
  }

  void _readImageFromCamera() async {
    image = await _imagePicker.pickImage(source: ImageSource.camera);
    emit(RegisterPickImage());
  }

  void selectImage() async {
    await Get.dialog(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              _readImageFromCamera();
              AppRoute.navigateBack();
            },
            icon: Icon(
              Icons.camera,
            ),
          ),
          IconButton(
            onPressed: () {
              _readImageFromGallery();
              AppRoute.navigateBack();
            },
            icon: Icon(
              Icons.photo_library,
            ),
          ),
        ],
      ),
    );
  }

  // validation
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter name !";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter password !";
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter password !";
    }
    if (passwordController.text != value) {
      return "not match with password";
    }
    return null;
  }

  // button function
  void onTap() async {
    emit(RegisterLoadingState());
    await AppDelay.delayLoading();

    if (globalKey.currentState!.validate()) {
      log(image?.path ?? "No Image");
      var respnse = await registerRepo.register(
        name: nameController.text,
        password: passwordController.text,
        image: image == null ? null : File(image!.path),
      );
      respnse.fold(
        (error) {
          emit(RegisterFailingState(errMessage: error));
        },
        (success) {
          log("Success");
          emit(RegisterSuccessState(message: success));
        },
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(RegisterNotValidateState());
    }
  }
}
