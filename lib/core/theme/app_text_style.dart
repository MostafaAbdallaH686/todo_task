import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_colors.dart';

abstract class AppTextStyle {
  static const TextStyle regular24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: MyColors.textblack,
  );
  static const TextStyle regular9 = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    color: MyColors.grey,
  );
  static const TextStyle regular12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: MyColors.grey,
  );
  static const TextStyle regular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: MyColors.black,
  );
  static const TextStyle regular16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: MyColors.black,
  );
  static const TextStyle meduim16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: MyColors.grey,
  );
  static const TextStyle meduim12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: MyColors.green,
  );
  static TextStyle light19({Color color = MyColors.white}) => TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w300,
        color: color,
      );
  static TextStyle light12({Color color = MyColors.textblack}) => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: color,
      );
  static const TextStyle light14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: MyColors.textblack,
  );
  static const TextStyle light16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: MyColors.textblack,
  );
  static TextStyle light20({Color color = MyColors.textblack}) => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w300,
        color: color,
      );
  static TextStyle extraLight14(Color color) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w200,
        color: color,
      );
}
