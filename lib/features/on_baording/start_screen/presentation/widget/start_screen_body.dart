import 'package:flutter/material.dart';
import 'package:to_do_app/core/helper/helper.dart';
import 'package:to_do_app/core/helper/shared_preferenece_key.dart';
import 'package:to_do_app/core/function/app_route.dart';
import 'package:to_do_app/core/function/app_svg_image.dart';
import 'package:to_do_app/core/function/app_width_height.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/core/utils/app_image.dart';
import 'package:to_do_app/core/utils/app_padding.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widget/default_custom_buttong.dart';
import 'package:to_do_app/features/auth/login/presentation/login_screen.dart';
import 'package:to_do_app/features/home/presentation/home_screen.dart';

class StartScreenBody extends StatelessWidget {
  const StartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.screenPaddingHorizonta22,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 40,
        children: [
          // top section
          AppSvgImage.showSvgImage(
            path: AppImage.startScreen,
            width: AppWidthHeight.persantageOfWidth((301.7 / 375) * 100),
            height: AppWidthHeight.persantageOfHeight((342.86 / 812) * 100),
          ),
          // center section
          Column(
            children: [
              Text(
                AppString.startScreenTitle1,
                style: AppTextStyle.regular24,
              ),
              Text(
                AppString.startScreenTitle2,
                style: AppTextStyle.regular24,
              ),
            ],
          ),
          Text(
            AppString.startScreenSubTitle,
            style: AppTextStyle.meduim16,
            textAlign: TextAlign.center,
          ),
          // bottom section
          DefaultCustomButtong(
            text: AppString.letisStart,
            onTap: () {
              Helper helper = Helper();
              bool? value =
                  helper.getData(key: SharedPrefereneceKey.isLogin) as bool?;
              if (value == null || value == false) {
                AppRoute.navigateToAndNoBack(LoginScreen());
              } else {
                AppRoute.navigateToAndNoBack(HomeScreen());
              }
            },
          ),
        ],
      ),
    );
  }
}
