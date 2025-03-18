import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/core/utils/app_distance.dart';
import 'package:to_do_app/core/utils/app_padding.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/features/settings/presentation/widget/custom_laungauge_card_half.dart';

class SettingScreenBody extends StatelessWidget {
  const SettingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.screenPaddingHorizonta22,
      child: Column(
        children: [
          SizedBox(height: AppHeight.h40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppString.language,
                style: AppTextStyle.light20(),
              ),
              Row(
                children: [
                  CustomLaungaugeCardHalf(
                    isLeft: true,
                    text: "AR",
                  ),
                  CustomLaungaugeCardHalf(
                    isLeft: false,
                    isSelect: true,
                    text: "EN",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
