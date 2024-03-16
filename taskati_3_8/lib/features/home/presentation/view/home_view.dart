import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati_3_8/core/utils/app_colors.dart';
import 'package:taskati_3_8/core/utils/text_styles.dart';
import 'package:taskati_3_8/features/add-task/data/task_model.dart';
import 'package:taskati_3_8/features/home/presentation/widgets/home_header.dart';
import 'package:taskati_3_8/features/home/presentation/widgets/task_item.dart';
import 'package:taskati_3_8/features/home/presentation/widgets/today_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedDate = DateFormat("dd/MM/yyyy").format(DateTime.now());
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
                  setState(() {
                    selectedDate = DateFormat("dd/MM/yyyy").format(date);
                  });
                },
              ),

              // tasks
              const Gap(15),
              Expanded(
                child: ValueListenableBuilder<Box<TaskModel>>(
                  valueListenable: Hive.box<TaskModel>('task').listenable(),
                  builder: (context, Box<TaskModel> box, child) {
                    List<TaskModel> tasks = [];
                    for (var task in box.values) {
                      // handel date
                      if (task.date == selectedDate) {
                        tasks.add(task);
                      }
                    }
                    if (tasks.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/empty.png'),
                            const Gap(20),
                            const Text('No Tasks'),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          key: UniqueKey(),
                          secondaryBackground: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(15),
                            color: AppColors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: AppColors.white,
                                ),
                                const Gap(5),
                                Text(
                                  'Delete',
                                  style: getBodyStyle(color: AppColors.white),
                                )
                              ],
                            ),
                          ),
                          background: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(15),
                            color: Colors.green,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: AppColors.white,
                                ),
                                const Gap(5),
                                Text(
                                  'Complete',
                                  style: getBodyStyle(color: AppColors.white),
                                )
                              ],
                            ),
                          ),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.startToEnd) {
                              box.put(
                                  tasks[index].id,
                                  TaskModel(
                                      id: tasks[index].id,
                                      title: tasks[index].title,
                                      note: tasks[index].note,
                                      date: tasks[index].date,
                                      startTime: tasks[index].startTime,
                                      endTime: tasks[index].endTime,
                                      color: 3,
                                      isComplete: true));
                            } else {
                              box.delete(tasks[index].id);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: TaskItem(
                              model: tasks[index],
                            ),
                          ),
                        );
                      },
                    );
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
