import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:up_course2/features/auth/task/presentation/screens/Home_Screen/home.dart';

import '../core/theme/theme.dart';
//import '../features/presention/screens/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          title: 'To Do App',
          theme: getAppTheme(),
          darkTheme: getAppDarkTheme(),
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: const SafeArea(child: Home()),
        );
      },
    );
  }
}
