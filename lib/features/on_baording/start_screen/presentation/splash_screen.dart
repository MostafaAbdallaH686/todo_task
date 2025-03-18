import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/function/app_route.dart';
import 'package:to_do_app/core/function/app_svg_image.dart';
import 'package:to_do_app/core/function/app_width_height.dart';
import 'package:to_do_app/core/utils/app_icon.dart';
import 'package:to_do_app/core/utils/app_image.dart';
import 'package:to_do_app/features/on_baording/start_screen/presentation/start_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60),
              InkWell(
                onTap: () {
                  AppRoute.navigateToAndNoBack(StartScreen());
                },
                child: Container(
                    width: 334,
                    height: 433,
                    margin: EdgeInsets.only(left: 20),
                    child: SvgPicture.asset(AppIcon.splash)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
