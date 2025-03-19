import 'package:flutter/material.dart';
import 'package:to_do_app/core/function/app_route.dart';
import 'package:to_do_app/core/utils/app_distance.dart';
import 'package:to_do_app/core/utils/app_icon.dart';
import 'package:to_do_app/core/utils/app_padding.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widget/custom_app_bar.dart';
import 'package:to_do_app/features/auth/login/presentation/login_screen.dart';
import 'package:to_do_app/features/profile/presentation/widget/custom_crad_profile.dart';
import 'package:to_do_app/features/settings/presentation/change_password_screen.dart';
import 'package:to_do_app/features/settings/presentation/setting_screen.dart';
import 'package:to_do_app/features/settings/presentation/update_profile.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.screenPaddingHorizonta22,
      child: SafeArea(
        child: Column(
          spacing: AppHeight.h25,
          children: [
            CustomAppBar(),
            CustomCardProfile(
              title: AppString.updateProfile,
              iconPath: AppIcon.updateProfile,
              onTap: () {
                AppRoute.navigateTo(UpdateProfile());
              },
            ),
            CustomCardProfile(
              title: AppString.changePassword,
              iconPath: AppIcon.changePassword,
              onTap: () {
                AppRoute.navigateTo(ChangePasswordScreen());
              },
            ),
            CustomCardProfile(
              title: AppString.settings,
              iconPath: AppIcon.settingsIcon,
              onTap: () {
                AppRoute.navigateTo(SettingScreen());
              },
            ),
            CustomCardProfile(
              title: AppString.logOut,
              iconPath: AppIcon.logoutIcon,
              onTap: () {
                AppRoute.navigateTo(LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
