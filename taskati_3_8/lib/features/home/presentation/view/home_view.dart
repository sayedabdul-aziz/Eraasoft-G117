import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_3_8/core/utils/app_colors.dart';
import 'package:taskati_3_8/features/home/presentation/widgets/home_header.dart';
import 'package:taskati_3_8/features/home/presentation/widgets/task_item.dart';
import 'package:taskati_3_8/features/home/presentation/widgets/today_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const HomeHeader(),
              const Gap(20),
              const TodayHeader(),
              const Gap(15),
              // date timeline
              DatePicker(
                DateTime.now(),
                width: 80,
                height: 100,
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primary,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),

              // tasks
              const Gap(15),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const TaskItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
