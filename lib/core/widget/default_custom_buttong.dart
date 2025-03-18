import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/core/utils/app_padding.dart';
import 'package:to_do_app/core/utils/app_radius.dart';

class DefaultCustomButtong extends StatelessWidget {
  const DefaultCustomButtong({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: AppPadding.buttonVerticalPadding10,
        decoration: BoxDecoration(
          color: MyColors.green,
          borderRadius: AppRadius.buttonRaduis,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              color: MyColors.green.withAlpha(220),
              blurRadius: 7,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyle.light19(),
          ),
        ),
      ),
    );
  }
}
