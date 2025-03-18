import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/core/helper/helper.dart';
import 'package:to_do_app/core/helper/shared_preferenece_key.dart';
import 'package:to_do_app/core/function/app_route.dart';
import 'package:to_do_app/core/function/app_snak_bar.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/utils/app_validator.dart';
import 'package:to_do_app/features/settings/data/repo/update_profile_repo.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial()) {
    Helper cacheHelper = Helper();
    String? username =
        cacheHelper.getDataString(key: SharedPrefereneceKey.username);
    usernameController = TextEditingController(text: username);
  }
  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  AppValidator validator = AppValidator();

  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController usernameController;

  XFile? image;
  final ImagePicker _imagePicker = ImagePicker();

  // read Image

  void _readImageFromGallery() async {
    image = await _imagePicker.pickImage(source: ImageSource.gallery);
    emit(UpdateProfilePickImage());
  }

  void _readImageFromCamera() async {
    image = await _imagePicker.pickImage(source: ImageSource.camera);
    emit(UpdateProfilePickImage());
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

  UpdateProfileRepo repo = UpdateProfileRepo();
  void onTap() async {
    emit(UpdateProfileLoading());

    if (globalKey.currentState!.validate()) {
      var response = await repo.update(
        name: usernameController.text,
        image: image == null ? null : File(image!.path),
      );
      response.fold(
        (e) => emit(UpdateProfileFailing(errMessage: e)),
        (r) async {
          await updateData();
          emit(UpdateProfileSuccess());
        },
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(UpdateProfileNotValidate());
    }
  }

  Future<void> updateData() async {
    var response = await repo.getUserData();
    response.fold((error) {
      AppSnakBar.showSnakBar2(
          title: AppString.error, message: "there was an error login again");
    }, (r) {
      return;
    });
  }
}
