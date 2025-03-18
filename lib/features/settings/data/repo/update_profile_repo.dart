import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:to_do_app/core/helper/helper.dart';
import 'package:to_do_app/core/helper/shared_preferenece_key.dart';
import 'package:to_do_app/core/dio/dio_exception.dart';
import 'package:to_do_app/core/network/api_endpoint.dart';
import 'package:to_do_app/core/network/api_helper.dart';
import 'package:to_do_app/core/network/api_keypoint.dart';
import 'package:to_do_app/features/auth/login/data/model/user_model.dart';

class UpdateProfileRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, void>> update(
      {required String name, required File? image}) async {
    try {
      log(name);
      log(image?.path ?? "Path not Valid");
      var path = image != null
          ? await MultipartFile.fromFile(image.path,
              filename: image.path.split('/').last)
          : null;
      log(path?.toString() ?? "");
      Map<String, dynamic> data = {};
      if (path == null) {
        data = {
          ApiKeypoint.userName: name,
        };
      } else {
        data = {
          ApiKeypoint.userName: name,
          ApiKeypoint.image: path,
        };
      }
      log(data.toString());
      await apiHelper.put(
          endPoint: ApiEndpoint.updateprofile, data: data, isAuth: true);
      log("Update Sucessfully");
      return right(0);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      log(e.toString());
      return left("oops! there was error");
    }
  }

  Helper cacheHelper = Helper();
  Future<Either<String, void>> getUserData() async {
    try {
      var response =
          await apiHelper.get(endPoint: ApiEndpoint.getuserdata, isAuth: true);
      UserLoginModel user = UserLoginModel.fromJson(response[ApiKeypoint.user]);

      log(" Get Data Reponse = ${response}");
      log(" Get Data Reponse = ${user.toMap()}");

      await cacheHelper.saveData(
          key: SharedPrefereneceKey.username, value: user.username);
      await cacheHelper.saveData(
          key: SharedPrefereneceKey.imagepath, value: user.image);
      return right(0);
    } on CustomDioException catch (e) {
      cacheHelper.saveData(key: SharedPrefereneceKey.isLogin, value: false);
      return left(e.errMessage);
    } catch (e) {
      cacheHelper.saveData(key: SharedPrefereneceKey.isLogin, value: false);
      return left("oops! there was an error");
    }
  }
}
