import 'package:dartz/dartz.dart';
import 'package:to_do_app/core/dio/dio_exception.dart';
import 'package:to_do_app/core/network/api_endpoint.dart';
import 'package:to_do_app/core/network/api_helper.dart';
import 'package:to_do_app/core/network/api_keypoint.dart';

class ChangePasswordRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, void>> changePassword(
      {required String currentpassword,
      required String newPassword,
      required String confirmNewPassword}) async {
    try {
      Map<String, dynamic> data = {
        ApiKeypoint.currentpassword: currentpassword,
        ApiKeypoint.newpassword: newPassword,
        ApiKeypoint.newpasswordconfirm: confirmNewPassword,
      };

      await apiHelper.post(
          endPoint: ApiEndpoint.changePassword, data: data, isAuth: true);
      return right(0);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left("oops! there was error");
    }
  }
}
