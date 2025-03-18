import 'package:flutter/material.dart';
import 'package:to_do_app/core/function/formate_date_time_string.dart';
import 'package:to_do_app/core/model/task_model.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/core/utils/app_distance.dart';
import 'package:to_do_app/core/utils/app_padding.dart';
import 'package:to_do_app/core/utils/app_radius.dart';

class HomeScreenBodyData extends StatelessWidget {
  const HomeScreenBodyData({super.key, required this.tasks});
  final List<TaskModel> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(0),
          color: MyColors.greenlight,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.homeCardRaduis,
          ),
          elevation: 5,
          // child: ListTile(
          //   contentPadding: EdgeInsets.all(0),
          //   title: Text(
          //     tasks[index].title,
          //     style: AppTextStyle.regular12,
          //   ),
          //   subtitle: Text(
          //     tasks[index].description,
          //     style: AppTextStyle.light14,
          //   ),
          // ),
          child: Padding(
            padding: AppPadding.taskContainerPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tasks[index].title,
                      // "My First Task",
                      style: AppTextStyle.regular12,
                    ),
                    Text(
                      formateDateTimeString(tasks[index].createAt),
                      style: AppTextStyle.light12(color: MyColors.grey),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Text(
                    tasks[index].description,
                    // "Improve my English skills by trying to speek",
                    style: AppTextStyle.light14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: tasks.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: AppHeight.h15);
      },
    );
  }
}
