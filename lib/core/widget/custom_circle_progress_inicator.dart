import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_colors.dart';

class CustomCircleProgressInicator extends StatelessWidget {
  const CustomCircleProgressInicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(color: MyColors.blue);
  }
}
