import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/function/app_route.dart';
import 'package:to_do_app/core/function/app_snak_bar.dart';
import 'package:to_do_app/core/function/app_width_height.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/utils/app_distance.dart';
import 'package:to_do_app/core/utils/app_image.dart';
import 'package:to_do_app/core/utils/app_padding.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widget/custom_circle_progress_inicator.dart';
import 'package:to_do_app/core/widget/default_custom_buttong.dart';
import 'package:to_do_app/core/widget/default_text_form_filed.dart';
import 'package:to_do_app/features/auth/register/manager/register_cubit/register_cubit.dart';
import 'package:to_do_app/features/auth/register/manager/register_cubit/register_state.dart';
import 'package:to_do_app/features/auth/share_widget/custom_botton_section_text.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 23,
        children: [
          SizedBox(
            height: AppHeight.h31,
          ),
          // top section
          // const CustomLogAuth(),
          Stack(
            children: [
              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    height:
                        AppWidthHeight.persantageOfHeight((160 / 812) * 100),
                    width: AppWidthHeight.persantageOfWidth((261 / 375) * 100),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: RegisterCubit.get(context).image == null
                        ? Image.asset(
                            AppImage.authLogo,
                          )
                        : Image.file(
                            File(RegisterCubit.get(context).image!.path),
                            fit: BoxFit.cover,
                          ),
                  );
                },
              ),
              Positioned(
                bottom: 5,
                right: 70,
                child: InkWell(
                  onTap: RegisterCubit.get(context).selectImage,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyColors.white,
                    ),
                    child: Icon(
                      Icons.photo_camera,
                      size: 21,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // center section
          Padding(
            padding: AppPadding.screenPaddingHorizonta22,
            child: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return Form(
                  key: RegisterCubit.get(context).globalKey,
                  autovalidateMode: RegisterCubit.get(context).autovalidateMode,
                  child: Column(
                    spacing: 10,
                    children: [
                      DefaultTextFormFiled(
                        label: AppString.userName,
                        hint: AppString.userName,
                        controller: RegisterCubit.get(context).nameController,
                        validator: RegisterCubit.get(context).nameValidator,
                      ),
                      DefaultTextFormFiled(
                        label: AppString.password,
                        hint: AppString.password,
                        controller:
                            RegisterCubit.get(context).passwordController,
                        validator: RegisterCubit.get(context).passwordValidator,
                      ),
                      DefaultTextFormFiled(
                        label: AppString.confirmPassword,
                        hint: AppString.confirmPassword,
                        controller: RegisterCubit.get(context)
                            .confirmPasswordController,
                        validator:
                            RegisterCubit.get(context).confirmPasswordValidator,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // button section
          Padding(
            padding: AppPadding.screenPaddingHorizonta22,
            child: Column(
              spacing: 32,
              children: [
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterFailingState) {
                      AppSnakBar.showSnakBar(
                          title: "Error", message: state.errMessage);
                    } else if (state is RegisterSuccessState) {
                      AppRoute.navigateBack();
                    }
                  },
                  builder: (context, state) {
                    if (state is RegisterLoadingState) {
                      return const CustomCircleProgressInicator();
                    }
                    return DefaultCustomButtong(
                      text: AppString.register,
                      onTap: RegisterCubit.get(context).onTap,
                    );
                  },
                ),
                CustomBottonSectionText(
                  startText: AppString.registerHaveAreayAccount,
                  buttonText: AppString.registerHaveAccount,
                  onPressed: () {
                    AppRoute.navigateBack();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
