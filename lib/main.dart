import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_course2/core/bloc/bloc_observer.dart';
import 'package:up_course2/core/dataBase/cache_helper.dart';
import 'package:up_course2/features/auth/task/cubit/cubit/task_cubit_cubit.dart';
import 'app/app.dart';
import 'core/dataBase/services/services.locator.dart';
import 'core/dataBase/sqflit_helper/sqflit_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  Bloc.observer = MyBlocObserver();
  await sl<CacheHelper>().init();
  sl<SqfliteHelper>().initDB();
  runApp(BlocProvider(
    create: (context) => TaskCubitCubit()..getTasks(),
    child: const MyApp(),
  ));
}
