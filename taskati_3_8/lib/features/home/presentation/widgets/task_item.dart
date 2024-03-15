import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_3_8/core/utils/app_colors.dart';
import 'package:taskati_3_8/core/utils/text_styles.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flutter task 1',
                style: getTitleStyle(color: AppColors.white),
              ),
              const Gap(5),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.white,
                    size: 18,
                  ),
                  const Gap(10),
                  Text(
                    '12:00 AM : 12:00 AM',
                    style: getSmallStyle(color: AppColors.white, fontSize: 12),
                  )
                ],
              ),
              const Gap(5),
              Text(
                'Flutter note',
                style: getBodyStyle(color: AppColors.white),
              )
            ],
          ),
          const Spacer(),
          Container(
            color: AppColors.white,
            width: .5,
            height: 60,
          ),
          const Gap(10),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              'TODO',
              style: getTitleStyle(color: AppColors.white, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
