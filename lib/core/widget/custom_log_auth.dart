import 'package:flutter/material.dart';
import 'package:to_do_app/core/function/app_width_height.dart';
import 'package:to_do_app/core/utils/app_image.dart';

class CustomLogAuth extends StatelessWidget {
  const CustomLogAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImage.authLogo,
      width: double.infinity,
      height: AppWidthHeight.persantageOfHeight((298 / 812) * 100),
      fit: BoxFit.fill,
    );
  }
}
