import 'package:to_do_app/core/network/api_keypoint.dart';

class UserLoginModel {
  final String username;
  final int id;
  final String? image;

  UserLoginModel(
      {required this.username, required this.id, required this.image});

  factory UserLoginModel.fromJson(Map json) {
    return UserLoginModel(
        username: json[ApiKeypoint.userName],
        id: json[ApiKeypoint.id],
        image: json[ApiKeypoint.imagepath]);
  }

  Map toMap() {
    return {
      ApiKeypoint.userName: username,
      ApiKeypoint.id: id,
      ApiKeypoint.imagepath: image,
    };
  }
}
