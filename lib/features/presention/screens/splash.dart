import 'package:flutter/material.dart';
import 'package:up_course2/core/dataBase/cache_helper.dart';
import 'package:up_course2/features/auth/task/presentation/screens/Home_Screen/home.dart';

import '../../../core/app,strings.dart';
import '../../../core/app.assets.dart';
import '../../../core/dataBase/services/services.locator.dart';
import 'on1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    bool isVisted =
        sl<CacheHelper>().getData(key: AppStrings.appOnBoarding) ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => isVisted ? const Home() : const On1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.background,
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.toDoLogo),
        ],
      ),
    ));
  }
}
