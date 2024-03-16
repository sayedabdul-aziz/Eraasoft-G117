import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_3_8/core/functions/routing.dart';
import 'package:taskati_3_8/core/services/local_storage.dart';
import 'package:taskati_3_8/core/utils/app_colors.dart';
import 'package:taskati_3_8/core/utils/text_styles.dart';
import 'package:taskati_3_8/core/widgets/custom_button.dart';
import 'package:taskati_3_8/features/add-task/data/task_model.dart';
import 'package:taskati_3_8/features/home/presentation/view/home_view.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  String date = DateFormat("dd/MM/yyyy").format(DateTime.now());
  String startTime = DateFormat("hh:mm a").format(DateTime.now());
  String endTime = DateFormat("hh:mm a")
      .format(DateTime.now().add(const Duration(minutes: 30)));

  var titleController = TextEditingController();
  var noteController = TextEditingController();
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primary,
            )),
        centerTitle: true,
        title: Text(
          'Add Task',
          style: getTitleStyle(color: AppColors.primary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --------Title-------------------
            Text(
              'Title',
              style: getTitleStyle(),
            ),
            const Gap(5),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Enter Task Title',
              ),
            ),
            const Gap(10),
            // --------Note-------------------
            Text(
              'Note',
              style: getTitleStyle(),
            ),
            const Gap(5),
            TextFormField(
              controller: noteController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Enter Task Note',
              ),
            ),
            const Gap(10),
            // --------Date-------------------
            Text(
              'Date',
              style: getTitleStyle(),
            ),
            const Gap(5),
            TextFormField(
              readOnly: true,
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025, 2, 15))
                    .then((value) {
                  if (value != null) {
                    setState(() {
                      date = DateFormat("dd/MM/yyyy").format(value);
                    });
                  }
                });
              },
              decoration: InputDecoration(
                  hintText: date,
                  hintStyle: getBodyStyle(),
                  suffixIcon: Icon(
                    Icons.calendar_month_rounded,
                    color: AppColors.primary,
                  )),
            ),

            // start and end time
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Start Time',
                    style: getTitleStyle(),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Text(
                    'End Time',
                    style: getTitleStyle(),
                  ),
                ),
              ],
            ),
            const Gap(5),
            Row(
              children: [
                // ----------- start time --------------
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            startTime = value.format(context);
                          });
                        }
                      });
                    },
                    decoration: InputDecoration(
                        hintText: startTime,
                        hintStyle: getBodyStyle(),
                        suffixIcon: Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.primary,
                        )),
                  ),
                ),
                const Gap(10),
                // ----------- end time --------------
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            endTime = value.format(context);
                          });
                        }
                      });
                    },
                    decoration: InputDecoration(
                        hintText: endTime,
                        hintStyle: getBodyStyle(),
                        suffixIcon: Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.primary,
                        )),
                  ),
                ),
              ],
            ),
            const Gap(20),
            // ----------- colors --------------
            Row(
              children: [
                Row(
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(3),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedColor = index;
                                });
                              },
                              child: CircleAvatar(
                                  backgroundColor: (index == 0)
                                      ? AppColors.primary
                                      : (index == 1)
                                          ? AppColors.orange
                                          : AppColors.red,
                                  child: (index == selectedColor)
                                      ? Icon(
                                          Icons.check,
                                          color: AppColors.white,
                                        )
                                      : const SizedBox()),
                            ),
                          )),
                ),
                const Spacer(),
                CustomButton(
                  text: '+ Add Task',
                  onPressed: () {
                    String id = DateTime.now().toString();
                    AppLocalStorage.cacheTask(
                        id,
                        TaskModel(
                            id: id,
                            title: titleController.text,
                            note: noteController.text,
                            date: date,
                            startTime: startTime,
                            endTime: endTime,
                            color: selectedColor,
                            isComplete: false));
                    pushWithReplacment(context, const HomeView());
                  },
                  width: 140,
                  height: 45,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
