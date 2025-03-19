import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/dio/dio_exception.dart';
import 'package:to_do_app/core/api/api_endpoint.dart';
import 'package:to_do_app/core/api/api_helper.dart';
import 'package:to_do_app/core/api/api_keypoint.dart';
import 'package:to_do_app/features/add_task/data/model/task_model.dart';

class AddTaskRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> addTask(
      {required String title, required String description}) async {
    try {
      TaskModel task = TaskModel(title: title, description: description);
      var response = await apiHelper.post(
          endPoint: ApiEndpoint.newTasks, data: task.toMap(), isAuth: true);

      String message = response[ApiKeypoint.message];
      return right(message);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(e.toString());
    }
  }
}
