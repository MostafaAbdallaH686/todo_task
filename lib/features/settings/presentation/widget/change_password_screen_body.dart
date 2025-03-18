import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/function/app_route.dart';
import 'package:to_do_app/core/function/app_snak_bar.dart';
import 'package:to_do_app/core/utils/app_distance.dart';
import 'package:to_do_app/core/utils/app_padding.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widget/custom_circle_progress_inicator.dart';
import 'package:to_do_app/core/widget/custom_log_auth.dart';
import 'package:to_do_app/core/widget/default_custom_buttong.dart';
import 'package:to_do_app/core/widget/default_text_form_filed.dart';
import 'package:to_do_app/features/profile/presentation/profile_screen.dart';
import 'package:to_do_app/features/settings/manager/change_password_cubit/cubit/change_password_cubit.dart';

class ChangePasswordScreenBody extends StatelessWidget {
  const ChangePasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLogAuth(),
        SizedBox(height: AppHeight.h23),
        Padding(
          padding: AppPadding.screenPaddingHorizonta22,
          child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
            listener: (context, state) {
              if (state is ChangePasswordFailing) {
                AppSnakBar.showSnakBar(
                  title: AppString.error,
                  message: state.errMessage,
                );
              } else if (state is ChangePasswordSuccess) {
                AppSnakBar.showSnakBar2(
                  title: AppString.success,
                  message: AppString.changePasswordSuccess,
                );

                AppRoute.navigateTo(ProfileScreen());
              }
            },
            builder: (context, state) {
              return Form(
                key: ChangePasswordCubit.get(context).globalKey,
                autovalidateMode:
                    ChangePasswordCubit.get(context).autovalidateMode,
                child: Column(
                  spacing: AppHeight.h10,
                  children: [
                    DefaultTextFormFiled(
                      label: AppString.oldPassword,
                      hint: AppString.oldPassword,
                      validator: ChangePasswordCubit.get(context)
                          .appValidator
                          .passwordValidator,
                      controller: ChangePasswordCubit.get(context)
                          .oldPasswordController,
                    ),
                    DefaultTextFormFiled(
                      label: AppString.newPassword,
                      hint: AppString.newPassword,
                      validator: ChangePasswordCubit.get(context)
                          .appValidator
                          .passwordValidator,
                      controller: ChangePasswordCubit.get(context)
                          .newPasswordController,
                    ),
                    DefaultTextFormFiled(
                      label: AppString.confirmPassword,
                      hint: AppString.confirmPassword,
                      validator: ChangePasswordCubit.get(context)
                          .confirmPaaswordvalidator,
                      controller: ChangePasswordCubit.get(context)
                          .confirmNewPasswordController,
                    ),
                    SizedBox(height: AppHeight.h12),
                    state is ChangePasswordLoading
                        ? CustomCircleProgressInicator()
                        : DefaultCustomButtong(
                            text: AppString.save,
                            onTap: ChangePasswordCubit.get(context).onTap,
                          )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
