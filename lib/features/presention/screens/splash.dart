import 'package:flutter/material.dart';
import 'package:up_course2/core/app.assets.dart';
import 'package:up_course2/core/app.colors.dart';
import 'package:up_course2/features/presention/screens/on1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    navigate();
  }
  void navigate(){
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (_)=> On1()));
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.toDoLogo),
            ],
          ),
        )
    );
  }
}
