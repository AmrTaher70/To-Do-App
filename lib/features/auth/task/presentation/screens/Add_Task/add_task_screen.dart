import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:up_course2/core/widgets/elev_button/elev_button.dart';
import '../../../../../../core/app,strings.dart';
import '../../../../../../core/app.colors.dart';

import '../../../../../presention/components/text_filed_task.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController textController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int currentIndex = 0;

  DateTime currentDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.appAddTask,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFiledTask(
                controller: textController,
                hintTitle: AppStrings.appHintTitle,
                title: AppStrings.appTitle,
              ),
              const SizedBox(height: 24),
              TextFiledTask(
                controller: noteController,
                hintTitle: AppStrings.appHintNote,
                title: AppStrings.appNote,
              ),
              const SizedBox(height: 24),
              TextFiledTask(
                controller: dateController,
                hintTitle: DateFormat.yMd().format(currentDate),
                title: 'Date',
                suffixIcon: IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2025),
                    );
                    setState(() {
                      if (pickedDate != null) {
                        currentDate = pickedDate;
                      } else {
                        print('pickedDate == null');
                      }
                    });
                  },
                  icon: const Icon(Icons.calendar_month_outlined),
                  color: AppColors.white,
                ),
                readonly: true,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextFiledTask(
                      controller: null,
                      hintTitle: startTime,
                      title: 'Start Time',
                      suffixIcon: IconButton(
                        onPressed: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                          );
                          setState(() {
                            if (pickedTime != null) {
                              startTime = pickedTime.format(context);
                            } else {
                              print('pickedTime == null');
                            }
                          });
                        },
                        icon: const Icon(Icons.timer_outlined),
                        color: AppColors.white,
                      ),
                      readonly: true,
                    ),
                  ),
                  const SizedBox(width: 27),
                  Expanded(
                    child: TextFiledTask(
                      controller: null,
                      hintTitle: endTime,
                      title: 'End Time',
                      suffixIcon: IconButton(
                        onPressed: () async {
                          TimeOfDay? pickedTime2 = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                          );
                          setState(() {
                            if (pickedTime2 != null) {
                              endTime = pickedTime2.format(context);
                            } else {
                              print('pickedTime2 == null');
                            }
                          });
                        },
                        icon: const Icon(Icons.timer_outlined),
                        color: AppColors.white,
                      ),
                      readonly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.appColor,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemBuilder: (context, index) {
                                Color getColor(index) {
                                  switch (index) {
                                    case 0:
                                      return AppColors.red;
                                    case 1:
                                      return AppColors.green;
                                    case 2:
                                      return AppColors.lightBlue;
                                    case 3:
                                      return AppColors.blue;
                                    case 4:
                                      return AppColors.orange;
                                    case 5:
                                      return AppColors.purple;
                                    default:
                                      return AppColors.gray;
                                  }
                                }

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: getColor(index),
                                    child: index == currentIndex
                                        ? const Icon(Icons.check)
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevCustomButton(
                  text: 'CREATE TASK',
                  onPressed: () {},
                  backgroundColor: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
