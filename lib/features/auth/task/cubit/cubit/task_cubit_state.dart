part of 'task_cubit_cubit.dart';

@immutable
abstract class TaskCubitState {}

class TaskCubitInitial extends TaskCubitState {}

class GetDateLoadingState extends TaskCubitState {}

class GetDateSuccessState extends TaskCubitState {}

class GetDateErrorState extends TaskCubitState {}

class GetTimeStartLoadingState extends TaskCubitState {}

class GetTimeStartSuccessState extends TaskCubitState {}

class GetTimeStartErrorState extends TaskCubitState {}

class GetTimeEndLoadingState extends TaskCubitState {}

class GetTimeEndSuccessState extends TaskCubitState {}

class GetTimeEndErrorState extends TaskCubitState {}

class ChangeCheckMarkIndexState extends TaskCubitState {}
