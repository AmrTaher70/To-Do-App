import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_course2/core/dataBase/cache_helper.dart';
import 'package:up_course2/features/auth/task/cubit/cubit/task_cubit_cubit.dart';
import 'app/app.dart';
import 'core/dataBase/services/services.locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await sl<CacheHelper>().init();
  runApp(BlocProvider(
    create: (context) => TaskCubitCubit(),
    child: const MyApp(),
  ));
}
