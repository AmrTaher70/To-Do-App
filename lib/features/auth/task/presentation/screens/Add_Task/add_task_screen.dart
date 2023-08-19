import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:up_course2/core/widgets/elev_button/elev_button.dart';
import 'package:up_course2/features/auth/task/cubit/cubit/task_cubit_cubit.dart';
import '../../../../../../core/widgets/app,strings.dart';
import '../../../../../../core/widgets/app.colors.dart';

import '../../../../../presention/components/text_filed_task.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
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
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocBuilder<TaskCubitCubit, TaskCubitState>(
              builder: (context, state) {
                final cubit = BlocProvider.of<TaskCubitCubit>(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFiledTask(
                      controller: cubit.textController,
                      hintTitle: AppStrings.appHintTitle,
                      title: AppStrings.appTitle,
                    ),
                    SizedBox(height: 24.h),
                    TextFiledTask(
                      controller: cubit.noteController,
                      hintTitle: AppStrings.appHintNote,
                      title: AppStrings.appNote,
                    ),
                    SizedBox(height: 24.h),
                    TextFiledTask(
                      controller: cubit.dateController,
                      hintTitle: DateFormat.yMd().format(cubit.currentDate),
                      title: 'Date',
                      suffixIcon: IconButton(
                        onPressed: () async {
                          cubit.getDate(context);
                        },
                        icon: const Icon(Icons.calendar_month_outlined),
                        color: AppColors.white,
                      ),
                      readonly: true,
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextFiledTask(
                            controller: null,
                            hintTitle: cubit.startTime,
                            title: 'Start Time',
                            suffixIcon: IconButton(
                              onPressed: () async {
                                cubit.getTimeStart(context);
                              },
                              icon: const Icon(Icons.timer_outlined),
                              color: AppColors.white,
                            ),
                            readonly: true,
                          ),
                        ),
                        SizedBox(width: 27.h),
                        Expanded(
                          child: TextFiledTask(
                            controller: null,
                            hintTitle: cubit.endTime,
                            title: 'End Time',
                            suffixIcon: IconButton(
                              onPressed: () async {
                                cubit.getTimeEnd(context);
                              },
                              icon: const Icon(Icons.timer_outlined),
                              color: AppColors.white,
                            ),
                            readonly: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    SizedBox(
                      height: 68.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.appColor,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(height: 8.h),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 6,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 8.w),
                                    itemBuilder: (context, index) {
                                      cubit.getColor;

                                      return GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<TaskCubitCubit>(
                                                  context)
                                              .changeCheckMarkIndex(index);
                                        },
                                        child: CircleAvatar(
                                          backgroundColor:
                                              BlocProvider.of<TaskCubitCubit>(
                                                      context)
                                                  .getColor(index),
                                          child: index ==
                                                  BlocProvider.of<
                                                              TaskCubitCubit>(
                                                          context)
                                                      .currentIndex
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
                    //  const Spacer(),
                    SizedBox(
                      height: 90.h,
                    ),
                    SizedBox(
                      height: 48.h,
                      width: double.infinity,
                      child: ElevCustomButton(
                        text: 'CREATE TASK',
                        onPressed: () {},
                        backgroundColor: AppColors.primary,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
