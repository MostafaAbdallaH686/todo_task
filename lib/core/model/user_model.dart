import 'dart:io';

import 'package:dio/dio.dart';
import 'package:to_do_app/core/network/api_keypoint.dart';

class UserModel {
  final String userName;
  final String password;
  final File? image;

  UserModel({required this.userName, required this.password, this.image});

  Future<Map<String, dynamic>> toMap() async {
    var path = image != null
        ? await MultipartFile.fromFile(image!.path,
            filename: image!.path.split('/').last)
        : null;
    return {
      ApiKeypoint.userName: userName,
      ApiKeypoint.password: password,
      ApiKeypoint.image: path,
    };
  }
}
