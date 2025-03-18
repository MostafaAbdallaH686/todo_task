import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';

class CustomBottonSectionText extends StatelessWidget {
  const CustomBottonSectionText(
      {super.key,
      required this.startText,
      required this.buttonText,
      this.onPressed});
  final String startText;
  final String buttonText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          startText,
          style: AppTextStyle.extraLight14(MyColors.black),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: AppTextStyle.regular14,
          ),
        )
      ],
    );
  }
}
