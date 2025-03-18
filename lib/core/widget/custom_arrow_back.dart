import 'package:flutter/material.dart';
import 'package:to_do_app/core/function/app_svg_image.dart';
import 'package:to_do_app/core/utils/app_icon.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppSvgImage.showSvgImage(
        path: AppIcon.arrowBack,
        // width: AppWidth.w14,
        // height: AppHeight.h8,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
