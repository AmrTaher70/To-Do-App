part of 'task_cubit_cubit.dart';

@immutable
abstract class TaskCubitState {}

class TaskCubitInitial extends TaskCubitState {}

class GetDateLoadingState extends TaskCubitState {}

class GetDateSuccessState extends TaskCubitState {}

class GetDateErrorState extends TaskCubitState {}

class GetSelectedDateLoadingState extends TaskCubitState {}

class GetSelectedDateSuccessState extends TaskCubitState {}

class GetTimeStartLoadingState extends TaskCubitState {}

class GetTimeStartSuccessState extends TaskCubitState {}

class GetTimeStartErrorState extends TaskCubitState {}

class GetTimeEndLoadingState extends TaskCubitState {}

class GetTimeEndSuccessState extends TaskCubitState {}

class GetTimeEndErrorState extends TaskCubitState {}

class ChangeCheckMarkIndexState extends TaskCubitState {}

class InsertTaskLoadingState extends TaskCubitState {}

class InsertTaskSuccessState extends TaskCubitState {}

class InsertTaskErrorState extends TaskCubitState {}

class GetTaskLoadingState extends TaskCubitState {}

class GetTaskSuccessState extends TaskCubitState {}

class GetTaskErrorState extends TaskCubitState {}

class UpdateTaskLoadingState extends TaskCubitState {}

class UpdateTaskSuccessState extends TaskCubitState {}

class UpdateTaskErrorState extends TaskCubitState {}

class DeleteTaskLoadingState extends TaskCubitState {}

class DeleteTaskSuccessState extends TaskCubitState {}

class DeleteTaskErrorState extends TaskCubitState {}
