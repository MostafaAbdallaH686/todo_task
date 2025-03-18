import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/settings/manager/update_profile_cubit/cubit/update_profile_cubit.dart';
import 'package:to_do_app/features/settings/presentation/widget/update_profile_body.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: Scaffold(
        body: UpdateProfileBody(),
      ),
    );
  }
}
