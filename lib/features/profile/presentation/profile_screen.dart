import 'package:flutter/material.dart';
import 'package:to_do_app/features/profile/presentation/widget/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileScreenBody(),
    );
  }
}
