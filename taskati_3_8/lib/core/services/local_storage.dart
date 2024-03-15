import 'package:hive_flutter/hive_flutter.dart';

class AppLocalStorage {
  static late Box userBox;

  static init() {
    userBox = Hive.box('user');
  }

  static cacheData(key, value) {
    userBox.put(key, value);
  }

  static getCachedData(key) {
    return userBox.get(key);
  }
}
