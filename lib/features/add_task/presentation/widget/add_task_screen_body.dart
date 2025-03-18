import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/function/app_route.dart';
import 'package:to_do_app/core/function/app_snak_bar.dart';
import 'package:to_do_app/core/function/app_width_height.dart';
import 'package:to_do_app/core/utils/app_distance.dart';
import 'package:to_do_app/core/utils/app_image.dart';
import 'package:to_do_app/core/utils/app_padding.dart';
import 'package:to_do_app/core/utils/app_radius.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widget/custom_circle_progress_inicator.dart';
import 'package:to_do_app/core/widget/default_custom_buttong.dart';
import 'package:to_do_app/core/widget/default_text_form_filed.dart';
import 'package:to_do_app/features/add_task/manager/add_task_cubit/cubit/add_task_cubit.dart';
import 'package:to_do_app/features/home/presentation/home_screen.dart';

class AddTaskScreenBody extends StatelessWidget {
  const AddTaskScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.screenPaddingHorizonta22,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: AppHeight.h31,
          ),
          Container(
            width: AppWidthHeight.persantageOfWidth((261 / 375) * 100),
            height: AppWidthHeight.persantageOfHeight((207 / 812) * 100),
            decoration: BoxDecoration(
              borderRadius: AppRadius.buttonRaduis,
              image: DecorationImage(
                image: AssetImage(
                  AppImage.authLogo,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: AppHeight.h31),
          BlocBuilder<AddTaskCubit, AddTaskState>(
            builder: (context, state) {
              return Form(
                key: AddTaskCubit.get(context).globalKey,
                autovalidateMode: AddTaskCubit.get(context).autovalidateMode,
                child: Column(
                  spacing: 17,
                  children: [
                    DefaultTextFormFiled(
                      label: AppString.title,
                      hint: AppString.title,
                      controller: AddTaskCubit.get(context).titelController,
                      validator: AddTaskCubit.get(context).validatorTitle,
                    ),
                    DefaultTextFormFiled(
                      label: AppString.description,
                      hint: AppString.description,
                      controller:
                          AddTaskCubit.get(context).descriptionController,
                      validator: AddTaskCubit.get(context).validatorDescription,
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: AppHeight.h31),
          BlocConsumer<AddTaskCubit, AddTaskState>(
            listener: (context, state) {
              if (state is AddTaskError) {
                AppSnakBar.showSnakBar(
                    title: "Error", message: state.errMessage);
              } else if (state is AddTaskSuccess) {
                AppRoute.navigateTo(HomeScreen());
              }
            },
            builder: (context, state) {
              if (state is AddTaskLoading) {
                return CustomCircleProgressInicator();
              }
              return DefaultCustomButtong(
                onTap: AddTaskCubit.get(context).onTap,
                text: AppString.addScreen,
              );
            },
          ),
        ],
      ),
    );
  }
}
