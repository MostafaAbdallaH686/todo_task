import 'package:flutter/material.dart';
import 'package:to_do_app/core/function/app_svg_image.dart';
import 'package:to_do_app/core/function/app_width_height.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/core/utils/app_icon.dart';
import 'package:to_do_app/core/utils/app_radius.dart';

class CustomCardProfile extends StatelessWidget {
  const CustomCardProfile({
    super.key,
    required this.iconPath,
    required this.title,
    this.onTap,
  });
  final String iconPath;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        tileColor: MyColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.buttonRaduis,
        ),
        leading: AppSvgImage.showSvgImage(
          height: AppWidthHeight.persantageOfHeight((30 / 812) * 100),
          width: AppWidthHeight.persantageOfWidth((30 / 375) * 100),
          path: iconPath,
          fit: BoxFit.scaleDown,
        ),
        title: Text(
          title,
          style: AppTextStyle.regular14,
        ),
        trailing: AppSvgImage.showSvgImage(
          path: AppIcon.arrowForward,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
