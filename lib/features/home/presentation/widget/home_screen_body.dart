import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/function/app_route.dart';
import 'package:to_do_app/core/function/app_svg_image.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/core/utils/app_distance.dart';
import 'package:to_do_app/core/utils/app_icon.dart';
import 'package:to_do_app/core/utils/app_padding.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widget/custom_app_bar.dart';
import 'package:to_do_app/core/widget/custom_circle_progress_inicator.dart';
import 'package:to_do_app/features/add_task/presentation/add_task_screen.dart';
import 'package:to_do_app/features/home/manager/home_cubit.dart/home_cubit.dart';
import 'package:to_do_app/features/home/manager/home_cubit.dart/home_state.dart';
import 'package:to_do_app/features/home/presentation/widget/home_screen_body_data.dart';
import 'package:to_do_app/features/home/presentation/widget/home_screen_body_no_data.dart';
import 'package:to_do_app/features/profile/presentation/profile_screen.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: MyColors.blue,
      onRefresh: () async {
        HomeCubit.get(context).getAllTasks();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: AppPadding.screenPaddingHorizonta22,
            child: Column(
              children: [
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return CustomAppBar(
                      onTapImage: () {
                        AppRoute.navigateTo(ProfileScreen());
                      },
                      trailing: InkWell(
                        onTap: () {
                          AppRoute.navigateTo(AddTaskScreen());
                        },
                        child: AppSvgImage.showSvgImage(
                          path: AppIcon.addIcon,
                          width: AppWidth.w24,
                          height: AppHeight.h24,
                        ),
                      ),
                    );
                  },
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    switch (state) {
                      case HomeLoadingState():
                        return Center(
                          child: CustomCircleProgressInicator(),
                        );
                      case HomeSuccessState():
                        return Column(
                          children: [
                            const SizedBox(height: AppHeight.h40),
                            Row(
                              children: [
                                Text(
                                  AppString.tasks,
                                  style: AppTextStyle.light14,
                                ),
                                SizedBox(width: AppWidth.w40),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: MyColors.greenOpacity15,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    state.tasks.length.toString(),
                                    style: AppTextStyle.meduim12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppHeight.h20),
                            HomeScreenBodyData(
                              tasks: state.tasks,
                            ),
                          ],
                        );
                      case HomeErrorState():
                        return Column(
                          children: [
                            Center(
                              child: Text(
                                state.errMessage,
                                style: AppTextStyle.regular24,
                              ),
                            ),
                          ],
                        );
                      case HomeSuccessNoDataState():
                        return HomeScreenBodyNoData();
                    }
                  },
                ),
                const SizedBox(height: AppHeight.h54),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
