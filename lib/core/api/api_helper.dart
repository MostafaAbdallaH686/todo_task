import 'package:dio/dio.dart' as dio;
import 'package:to_do_app/core/helper/helper.dart';
import 'package:to_do_app/core/helper/shared_preferenece_key.dart';
import 'package:to_do_app/core/dio/dio_exception.dart';
import 'package:to_do_app/core/api/api_configration.dart';
import 'package:to_do_app/core/api/api_keypoint.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper _instance = ApiHelper._();
  factory ApiHelper() {
    return _instance;
  }

  final objectDio = dio.Dio(ApiConfigration.option());

  Future<dynamic> get({
    required String endPoint,
    bool isAuth = false,
  }) async {
    try {
      var response = await objectDio.get(endPoint,
          options: dio.Options(headers: getOption(isAuth)));
      return response.data;
    } on dio.DioException catch (e) {
      throw CustomDioException(
          errMessage: ServerFailure.fromDioError(e).errorMessage);
    }
  }

  Future<dynamic> post(
      {required String endPoint,
      required Map<String, dynamic>? data,
      bool isAuth = false,
      bool isReferechToken = false}) async {
    try {
      final formData = dio.FormData.fromMap(data ?? {});
      var response = await objectDio.post(
        endPoint,
        data: formData,
        options: dio.Options(
          headers: getOption(isAuth, isReferechToken: isReferechToken),
        ),
      );
      return response.data;
    } on dio.DioException catch (e) {
      throw CustomDioException(
          errMessage: ServerFailure.fromDioError(e).errorMessage);
    }
  }

  Future<dynamic> put({
    required String endPoint,
    required Map<String, dynamic>? data,
    bool isAuth = false,
  }) async {
    try {
      final formData = dio.FormData.fromMap(data ?? {});
      var response = await objectDio.put(
        endPoint,
        data: formData,
        options: dio.Options(
          headers: getOption(isAuth),
        ),
      );
      return response.data;
    } on dio.DioException catch (e) {
      throw CustomDioException(
          errMessage: ServerFailure.fromDioError(e).errorMessage);
    }
  }

  Future<dynamic> patch(String endPoint) async {
    var response = await objectDio.patch(endPoint);
    return response.data;
  }

  Future<dynamic> delete(String endPoint) async {
    var response = await objectDio.delete(endPoint);
    return response.data;
  }

  Map<String, dynamic>? getOption(bool isAuth, {bool isReferechToken = false}) {
    Helper cacheHelpe = Helper();
    if (isAuth) {
      return {
        ApiKeypoint.authorization: cacheHelpe.getDataString(
                    key: SharedPrefereneceKey.accesstoken) !=
                null
            ? "Bearer ${cacheHelpe.getDataString(key: SharedPrefereneceKey.accesstoken)}"
            : null,
      };
    }
    if (isReferechToken) {
      return {
        ApiKeypoint.authorization: cacheHelpe.getDataString(
                    key: SharedPrefereneceKey.refreshtoken) !=
                null
            ? "Bearer ${cacheHelpe.getDataString(key: SharedPrefereneceKey.refreshtoken)}"
            : null,
      };
    } else {
      return null;
    }
  }
}
