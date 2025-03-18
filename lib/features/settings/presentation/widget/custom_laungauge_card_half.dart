import 'package:flutter/material.dart';
import 'package:to_do_app/core/function/app_width_height.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';

class CustomLaungaugeCardHalf extends StatelessWidget {
  const CustomLaungaugeCardHalf({
    super.key,
    required this.isLeft,
    required this.text,
    this.isSelect = false,
  });
  final bool isLeft;
  final bool isSelect;

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppWidthHeight.persantageOfWidth((51 / 375) * 100),
      height: AppWidthHeight.persantageOfHeight((50 / 812) * 100),
      decoration: BoxDecoration(
        color: isSelect ? MyColors.green : MyColors.greenlight2,
        borderRadius: isLeft
            ? BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              )
            : BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyle.light20(
            color: isSelect ? MyColors.white : MyColors.textblack,
          ),
        ),
      ),
    );
  }
}
