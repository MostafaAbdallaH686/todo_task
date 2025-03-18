import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/function/app_route.dart';
import 'package:to_do_app/core/function/app_snak_bar.dart';
import 'package:to_do_app/core/utils/app_padding.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widget/custom_circle_progress_inicator.dart';
import 'package:to_do_app/core/widget/custom_log_auth.dart';
import 'package:to_do_app/core/widget/default_custom_buttong.dart';
import 'package:to_do_app/core/widget/default_text_form_filed.dart';
import 'package:to_do_app/features/auth/login/manager/login_cubit/login_cubit.dart';
import 'package:to_do_app/features/auth/login/manager/login_cubit/login_state.dart';
import 'package:to_do_app/features/auth/register/presentation/register_screen.dart';
import 'package:to_do_app/features/auth/share_widget/custom_botton_section_text.dart';
import 'package:to_do_app/features/home/presentation/home_screen.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 23,
        children: [
          // top section
          const CustomLogAuth(),
          // center section
          Padding(
            padding: AppPadding.screenPaddingHorizonta22,
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Form(
                  key: LoginCubit.get(context).globalKey,
                  autovalidateMode: LoginCubit.get(context).autovalidateMode,
                  child: Column(
                    spacing: 10,
                    children: [
                      DefaultTextFormFiled(
                        label: AppString.userName,
                        hint: AppString.userName,
                        controller: LoginCubit.get(context).nameController,
                        validator: LoginCubit.get(context).nameValidator,
                      ),
                      DefaultTextFormFiled(
                        label: AppString.password,
                        hint: AppString.password,
                        controller: LoginCubit.get(context).passwordController,
                        validator: LoginCubit.get(context).passwordValidator,
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
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    log(state.toString());
                    if (state is LoginFailingState) {
                      AppSnakBar.showSnakBar(
                          title: "Error", message: state.errMessage);
                    } else if (state is LoginSuccessState) {
                      log("Success Login");
                      AppRoute.navigateTo(HomeScreen());
                      log("Success Login");
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const CustomCircleProgressInicator();
                    }
                    return DefaultCustomButtong(
                      text: AppString.login,
                      onTap: LoginCubit.get(context).onTap,
                    );
                  },
                ),
                CustomBottonSectionText(
                  startText: AppString.loginScreenNoAcount,
                  buttonText: AppString.loginScreenCreateAcount,
                  onPressed: () {
                    AppRoute.navigateTo(RegisterScreen());
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
