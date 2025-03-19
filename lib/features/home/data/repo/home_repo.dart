import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/dio/dio_exception.dart';
import 'package:to_do_app/core/model/task_model.dart';
import 'package:to_do_app/core/api/api_endpoint.dart';
import 'package:to_do_app/core/api/api_helper.dart';
import 'package:to_do_app/core/api/api_keypoint.dart';

class HomeRepo {
  HomeRepo._();

  static HomeRepo? _instance;
  factory HomeRepo() {
    _instance ??= HomeRepo._();
    return _instance!;
  }

  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, List<TaskModel>>> getTasks() async {
    try {
      var response =
          await apiHelper.get(endPoint: ApiEndpoint.mytasks, isAuth: true);
      List<TaskModel> tasks = [];

      for (var element in response[ApiKeypoint.tasks]) {
        tasks.add(TaskModel.fromJson(element));
      }

      return right(tasks);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(e.toString());
    }
  }
}
