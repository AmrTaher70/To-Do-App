import 'package:flutter/material.dart';

import '../core/theme/theme.dart';
import '../features/presention/screens/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'To Do App',
        theme: getAppTheme(),
        darkTheme: getAppDarkTheme(),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: const SafeArea(child: SplashScreen()));
  }
}
