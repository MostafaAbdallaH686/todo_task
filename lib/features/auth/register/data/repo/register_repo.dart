import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/dio/dio_exception.dart';
import 'package:to_do_app/core/model/user_model.dart';
import 'package:to_do_app/core/network/api_endpoint.dart';
import 'package:to_do_app/core/network/api_helper.dart';
import 'package:to_do_app/core/network/api_keypoint.dart';

class RegisterRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> register({
    required String name,
    required String password,
    File? image,
  }) async {
    try {
      log(image?.path ?? "Image Null");
      UserModel user =
          UserModel(userName: name, password: password, image: image);
      var data = await user.toMap();
      log(user.image?.path ?? "Image Null");
      log(data.toString());

      var response = await apiHelper.post(
          endPoint: ApiEndpoint.register, data: data) as Map;
      String message = response[ApiKeypoint.message];
      return right(message);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(e.toString());
    }
  }
}
