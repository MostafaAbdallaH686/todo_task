import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/features/home/manager/home_cubit.dart/home_cubit.dart';
import 'package:to_do_app/features/home/presentation/widget/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: Builder(builder: (context) {
          return HomeScreenBody();
        }),
      ),
    );
  }
}
