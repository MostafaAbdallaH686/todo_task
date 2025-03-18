import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/function/app_route.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widget/custom_arrow_back.dart';
import 'package:to_do_app/features/add_task/manager/add_task_cubit/cubit/add_task_cubit.dart';
import 'package:to_do_app/features/add_task/presentation/widget/add_task_screen_body.dart';
import 'package:to_do_app/features/home/presentation/home_screen.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.scaffoldBackground,
          centerTitle: true,
          title: Text(
            AppString.addScreen,
            style: AppTextStyle.light19(
              color: MyColors.textblack,
            ),
          ),
          leading: CustomArrowBack(
            onTap: () {
              AppRoute.navigateTo(
                HomeScreen(),
              );
            },
          ),
        ),
        body: AddTaskScreenBody(),
      ),
    );
  }
}
