import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_3_8/core/services/local_storage.dart';
import 'package:taskati_3_8/core/theme/theme.dart';
import 'package:taskati_3_8/features/add-task/data/task_model.dart';
import 'package:taskati_3_8/features/splash_view.dart';

//1) add to pubspec
//2) init. hive
//2) open your box (like table)
// Stepp : register adabter (model) // to store object
// create typeAdapter (annottion class and its fields)
//3) get opened box
//4) dealing with your box

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  await Hive.openBox<TaskModel>('task');
  await Hive.openBox('user');
  AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('user').listenable(),
      builder: (context, box, child) {
        bool darkMode = box.get('darkMode', defaultValue: false);
        return MaterialApp(
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          // LIGHT
          theme: AppThemes.appLightTheme,
          // DARK
          darkTheme: AppThemes.appDarkTheme,
          debugShowCheckedModeBanner: false,
          home: const SplashView(),
        );
      },
    );
  }
}
