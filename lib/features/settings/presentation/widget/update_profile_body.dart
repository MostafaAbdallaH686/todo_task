import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helper/helper.dart';
import 'package:to_do_app/core/helper/shared_preferenece_key.dart';
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
import 'package:to_do_app/features/profile/presentation/profile_screen.dart';
import 'package:to_do_app/features/settings/manager/update_profile_cubit/cubit/update_profile_cubit.dart';

class UpdateProfileBody extends StatelessWidget {
  const UpdateProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.screenPaddingHorizonta22,
      child: Column(
        spacing: AppHeight.h27,
        children: [
          SizedBox(
            height: AppHeight.h54,
          ),
          // top section
          // const CustomLogAuth(),
          Stack(
            children: [
              BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                builder: (context, state) {
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    height:
                        AppWidthHeight.persantageOfHeight((260 / 812) * 100),
                    width: AppWidthHeight.persantageOfWidth((500 / 375) * 100),
                    decoration: BoxDecoration(
                        //   shape: BoxShape.circle,
                        ),
                    child: UpdateProfileCubit.get(context).image == null
                        ? getImage()
                        : Image.file(
                            File(UpdateProfileCubit.get(context).image!.path),
                            fit: BoxFit.cover,
                          ),
                  );
                },
              ),
              Positioned(
                bottom: 5,
                right: 70,
                child: InkWell(
                  onTap: UpdateProfileCubit.get(context).selectImage,
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

          BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
            builder: (context, state) {
              return Form(
                key: UpdateProfileCubit.get(context).globalKey,
                autovalidateMode:
                    UpdateProfileCubit.get(context).autovalidateMode,
                child: DefaultTextFormFiled(
                  label: AppString.userName,
                  hint: AppString.userName,
                  controller:
                      UpdateProfileCubit.get(context).usernameController,
                  validator:
                      UpdateProfileCubit.get(context).validator.nameValidator,
                ),
              );
            },
          ),
          BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
            listener: (context, state) {
              if (state is UpdateProfileFailing) {
                AppSnakBar.showSnakBar(
                    title: AppString.error, message: state.errMessage);
              } else if (state is UpdateProfileSuccess) {
                AppSnakBar.showSnakBar2(
                  title: AppString.success,
                  message: AppString.updateprofilesuccess,
                );
                AppRoute.navigateTo(ProfileScreen());
              }
            },
            builder: (context, state) {
              if (state is UpdateProfileLoading) {
                return CustomCircleProgressInicator();
              }
              return DefaultCustomButtong(
                text: AppString.update,
                onTap: UpdateProfileCubit.get(context).onTap,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget getImage() {
    Helper cacheHelper = Helper();
    String? image =
        cacheHelper.getDataString(key: SharedPrefereneceKey.imagepath);
    if (image == null) {
      return Image.asset(
        AppImage.authLogo,
      );
    } else {
      return Image.network(
        image,
        fit: BoxFit.cover,
      );
    }
  }
}
