import 'package:flutter/material.dart';
import 'package:up_course2/features/presention/screens/on1.dart';
import 'package:up_course2/features/presention/screens/on2.dart';
import 'package:up_course2/features/presention/screens/splash.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
      );
  }
}
