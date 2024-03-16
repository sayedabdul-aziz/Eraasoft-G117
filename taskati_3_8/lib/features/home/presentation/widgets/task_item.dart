import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_3_8/core/utils/app_colors.dart';
import 'package:taskati_3_8/core/utils/text_styles.dart';
import 'package:taskati_3_8/features/add-task/data/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.model,
  });

  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 7),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (model.color == 0)
            ? AppColors.primary
            : (model.color == 1)
                ? AppColors.orange
                : (model.color == 2)
                    ? AppColors.red
                    : Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
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
                    '${model.startTime} : ${model.endTime}',
                    style: getSmallStyle(color: AppColors.white, fontSize: 12),
                  )
                ],
              ),
              const Gap(5),
              Text(
                model.note,
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
              model.isComplete ? 'COMPLETED' : 'TODO',
              style: getTitleStyle(color: AppColors.white, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
