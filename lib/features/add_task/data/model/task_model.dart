import 'package:to_do_app/core/network/api_keypoint.dart';

class TaskModel {
  final String title;
  final String description;

  TaskModel({required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {
      ApiKeypoint.title: title,
      ApiKeypoint.description: description,
    };
  }
}
