import 'package:flutter/material.dart';
import 'package:up_course2/core/dataBase/cache_helper.dart';
import 'app/app.dart';
import 'core/dataBase/services/services.locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  await sl<CacheHelper>().init();
  runApp(const MyApp());
}
