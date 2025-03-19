import 'package:to_do_app/core/helper/helper.dart';
import 'package:to_do_app/core/helper/shared_preferenece_key.dart';
import 'package:to_do_app/core/dio/dio_exception.dart';
import 'package:to_do_app/core/function/app_route.dart';
import 'package:to_do_app/core/api/api_endpoint.dart';
import 'package:to_do_app/core/api/api_helper.dart';
import 'package:to_do_app/core/api/api_keypoint.dart';
import 'package:to_do_app/features/auth/login/presentation/login_screen.dart';

void handleExpairedAcessToken() async {
  ApiHelper apiHelper = ApiHelper();
  Helper cacheHelper = Helper();
  try {
    var respose = await apiHelper.post(
        endPoint: ApiEndpoint.refreshtoken, data: null, isReferechToken: true);
    cacheHelper.saveData(
        key: SharedPrefereneceKey.accesstoken,
        value: respose[ApiKeypoint.accesstoken]);
  } on CustomDioException catch (e) {
    return;
  } catch (e) {
    return;
  }
}

void handleExpairedRefrechToken() {
  Helper cacheHelper = Helper();

  cacheHelper.saveData(key: SharedPrefereneceKey.isLogin, value: false);
  AppRoute.navigateTo(LoginScreen());
}
