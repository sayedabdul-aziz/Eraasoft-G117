import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati_3_8/features/add-task/data/task_model.dart';

class AppLocalStorage {
  static late Box userBox;
  static late Box taskBox;

  static init() {
    userBox = Hive.box('user');
    taskBox = Hive.box<TaskModel>('task');
  }

  static cacheData(key, value) {
    userBox.put(key, value);
  }

  static getCachedData(key) {
    return userBox.get(key);
  }

  static cacheTask(key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel getTask(key) {
    return taskBox.get(key);
  }
}
