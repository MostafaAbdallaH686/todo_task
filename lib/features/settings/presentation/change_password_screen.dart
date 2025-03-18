import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/settings/manager/change_password_cubit/cubit/change_password_cubit.dart';
import 'package:to_do_app/features/settings/presentation/widget/change_password_screen_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: Scaffold(
        body: ChangePasswordScreenBody(),
      ),
    );
  }
}
