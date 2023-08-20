import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:up_course2/core/dataBase/services/services.locator.dart';

import '../../../../../core/dataBase/sqflit_helper/sqflit_helper.dart';
import '../../../../../core/widgets/app.colors.dart';
import '../../data/model_task.dart';

part 'task_cubit_state.dart';

class TaskCubitCubit extends Cubit<TaskCubitState> {
  TaskCubitCubit() : super(TaskCubitInitial());
  TextEditingController textController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int currentIndex = 0;
  DateTime currentDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void getDate(context) async {
    emit((GetDateLoadingState()));
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      currentDate = pickedDate;
      emit((GetDateSuccessState()));
    } else {
      emit((GetDateErrorState()));
    }
  }

  void getTimeStart(context) async {
    emit((GetTimeStartLoadingState()));
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickedTime != null) {
      startTime = pickedTime.format(context);
      emit((GetTimeStartSuccessState()));
    } else {
      emit((GetTimeStartErrorState()));
    }
  }

  void getTimeEnd(context) async {
    emit((GetTimeEndLoadingState()));
    TimeOfDay? pickedTime2 = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickedTime2 != null) {
      endTime = pickedTime2.format(context);
      emit((GetTimeEndSuccessState()));
    } else {
      emit((GetTimeEndErrorState()));
    }
  }

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

  void changeCheckMarkIndex(index) {
    currentIndex = index;
    emit(ChangeCheckMarkIndexState());
  }

  List<ModelTaskManager> taskList = [];
  void insertTask() async {
    emit(InsertTaskLoadingState());
    try {
      await sl<SqfliteHelper>().insertToDB(
        ModelTaskManager(
          title: textController.text,
          note: noteController.text,
          startTime: startTime,
          date: DateFormat.yMd().format(currentDate),
          endTime: endTime,
          isCompleted: 0,
          color: currentIndex,
        ),
      );
      getTasks();
      textController.clear();
      noteController.clear();
      emit(InsertTaskSuccessState());
    } catch (e) {
      emit(InsertTaskErrorState());
    }
  }

//! getTasks
  void getTasks() async {
    emit(GetTaskLoadingState());
    await sl<SqfliteHelper>().getFromDB().then((value) {
      taskList = value.map((e) => ModelTaskManager.fromJson(e)).toList();
      emit(GetTaskSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(GetTaskErrorState());
    });
  }

  //! updateTask
  void updateTask(id) async {
    emit(UpdateTaskLoadingState());
    await sl<SqfliteHelper>().updateDB(id).then((value) {
      getTasks();
      emit(UpdateTaskSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(UpdateTaskErrorState());
    });
  }
}
