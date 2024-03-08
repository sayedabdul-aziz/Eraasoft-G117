import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_3_8/core/theme/app_theme.dart';
import 'package:taskati_3_8/features/splash_view.dart';

//1) add to pubspec
//2) init. hive
//2) open your box (like table)
//3) get opened box
//4) dealing with your box

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('user');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
